from giza.agents import GizaAgent, AgentResult
import numpy as np
import pandas as pd
import os
from dotenv import load_dotenv
from typing import Any
import time
import click


load_dotenv()

RECIPIENT = os.environ["RECIPIENT"]
import logging

logger = logging.getLogger()
logger.setLevel("DEBUG")


def predict(agent: GizaAgent, X: np.ndarray) -> AgentResult:
    prediction = (
        agent.predict(
            input_feed={"input": X}, verifiable=True, job_size="M", model_category="XGB"
        ),
    )
    return prediction


def create_agents(
    model_ids: list[int], version_id: int, chain: str, contracts: dict, account: str
) -> list[GizaAgent]:
    return [
        GizaAgent(
            contracts=contracts,
            id=model_id,
            version_id=version_id,
            chain=chain,
            account=account,
        )
        for model_id in model_ids
    ]


def load_data():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(current_dir, "data", "merged_data.csv")

    data = pd.read_csv(file_path)
    return data


def execute_actions(contracts: Any, value: float):
    slot0 = contracts.pool.slot0()
    print(slot0)

    recipient = RECIPIENT
    amount_in = int(value * 10**8)

    if contracts.WBTC.allowance(recipient, contracts.swap_router.address) < amount_in:
        contracts.WBTC.approve(contracts.swap_router.address, amount_in)

    swap_params = {
        "tokenIn": contracts.WBTC.address,
        "tokenOut": contracts.USDC.address,
        "fee": 3000,
        "recipient": recipient,
        "deadline": int(time.time()) + 60,
        "amountIn": amount_in,
        "amountOutMinimum": 0,
        "sqrtPriceLimitX96": int(slot0.sqrtPriceX96 / 2),
    }
    contracts.swap_router.exactInputSingle(swap_params)


@click.command()
@click.option(
    "--electricity_day_price",
    required=True,
    help="daily price of electricity for today, assuming 100% utilisation - ie 24 hrs",
    type=float,
)
@click.option("--btc_price", required=True, type=float)
@click.option("--difficulty", required=True, type=float)
@click.option("--hash_rate", required=True, type=float)
@click.option("--power", required=True, type=float)
@click.option("--block_reward", required=True, type=float)
@click.option("--cost_2_months", required=True, type=float)
@click.option("--cost_3_months", required=True, type=float)
@click.option("--cost_4_months", required=True, type=float)
@click.option("--cost_5_months", required=True, type=float)
@click.option("--cost_6_months", required=True, type=float)
def run_agents(
    electricity_day_price,
    btc_price,
    difficulty,
    hash_rate,
    power,
    block_reward,
    cost_2_months,
    cost_3_months,
    cost_4_months,
    cost_5_months,
    cost_6_months,
):
    contracts = {
        "WBTC": "0x29f2D40B0605204364af54EC677bD022dA425d03",
        "USDC": "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8",
        "swap_router": "0x3bFA4769FB09eefC5a80d6E87c3B9C650f7Ae48E",
        "pool": "0x3faC21f2d59d890BA23b82028aB2B3dA8ae5A116",
    }
    model_ids = [728, 727, 726, 725]
    version_id = 2
    chain = f"ethereum:sepolia:{os.environ['SEPOLIA_RPC_URL']}"

    click.echo("Creating agents")
    agents = create_agents(model_ids, version_id, chain, contracts, "aidala_working")
    click.echo("Running predictions and agents")
    model_input = np.array(
        [
            electricity_day_price,
            btc_price,
            difficulty,
            hash_rate,
            power,
            block_reward,
            cost_2_months,
            cost_3_months,
            cost_4_months,
            cost_5_months,
            cost_6_months,
        ]
    )
    for index, agent in enumerate(agents):
        click.echo(f"Running agent for {5 - index} months in the future")
        prediction = predict(agent, model_input)
        click.echo(f"Prediction {prediction}")
        value = float(prediction[0].value)

        if value < 1:
            with agent.execute() as contracts:
                execute_actions(contracts, value)
            break

    click.echo("Aidala Agent finished")


if __name__ == "__main__":
    run_agents()
