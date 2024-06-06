from giza.agents import GizaAgent
import numpy as np
import pandas as pd
import os
from dotenv import load_dotenv
from giza.agents.model import GizaModel
from eth_abi import encode
import web3
import web3.eth
from typing import Any

load_dotenv()


import logging

logger = logging.getLogger()
logger.setLevel("DEBUG")


def predict(agent: GizaAgent, X: np.ndarray):
    prediction = (
        agent.predict(
            input_feed={"input": X}, verifiable=True, job_size="M", model_category="XGB"
        ),
    )
    return prediction


def create_agent(
    model_id: int, version_id: int, chain: str, contracts: dict, account: str
):
    agent = GizaAgent(
        contracts=contracts,
        id=model_id,
        version_id=version_id,
        chain=chain,
        account=account,
    )
    return agent


def load_data():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(current_dir, "data", "merged_data.csv")

    data = pd.read_csv(file_path)
    return data


def execute_actions(contracts: Any, value: str):
    w3 = web3.Web3(web3.Web3.HTTPProvider(os.environ["SEPOLIA_RPC_URL"]))


    recipient = "0xAb616594bc7BA3b3B11711718E4D9eA962Ec6f82"
    amount_in = int(float(value) * 10**8)

    contracts.WBTC.approve("0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD", amount_in)
    minimum_amount_out = 0

    uniswap_path = encode(
        ["address", "uint256", "address"],
        [
            "0x29f2D40B0605204364af54EC677bD022dA425d03",
            3000,
            "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8",
        ],
    )
    inputs = encode(
        ["address", "uint256", "uint256", "bytes", "bool"],
        [recipient, amount_in, minimum_amount_out, uniswap_path, False],
    )

    deadline = int(w3.eth.get_block('latest')["timestamp"]) + 1200

    commands = b"\x00"
    response = contracts.universal_router.execute(commands, [inputs], deadline)
    breakpoint()
    print(0)

def main():
    contracts = {
        "WBTC": "0x29f2D40B0605204364af54EC677bD022dA425d03",
        "USDC": "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8",
        "universal_router": "0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD",
    }
    model_id = 680
    version_id = 4
    chain = f"ethereum:sepolia:{os.environ['SEPOLIA_RPC_URL']}"

    # data = load_data()
    # independent_values = data[
    #     [
    #         "Electricity_day_price",
    #         "Difficulty",
    #         "HashRate",
    #         "Power",
    #         "Block Reward",
    #         "Cost_2_months",
    #         "Cost_3_months",
    #         "Cost_4_months",
    #         "Cost_5_months",
    #         "Cost_6_months",
    #     ]
    # ].values

    # last_value = independent_values[-1, :]
    # last_value[1] /= 10**13
    print("Creating agent")
    agent = create_agent(model_id, version_id, chain, contracts, "aidala_working")
    print("Running prediction")
    # prediction = predict(agent, last_value)
    # print(f"Prediction {prediction}")
    # value = float(prediction[0].value)
    value = 0.09
    if value < 1:
        with agent.execute() as contracts:
            execute_actions(contracts, value)


if __name__ == "__main__":
    main()
