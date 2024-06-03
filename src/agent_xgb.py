from giza.agents import GizaAgent
import numpy as np
import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()


def predict(agent: GizaAgent, X: np.ndarray):
    """
    Predict the next day volatility.

    Args:
        X (np.ndarray): Input to the model.

    Returns:
        int: Predicted value.
    """
    prediction = agent.predict(input_feed={"val": X}, verifiable=True, job_size="XL")
    return prediction


def create_agent(
    model_id: int, version_id: int, chain: str, contracts: dict, account: str
):
    """
    Create a Giza agent for the volatility prediction model
    """
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


def main():
    contracts = {
        "WBTC" : "0x29f2D40B0605204364af54EC677bD022dA425d03",
        "USDC": "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8",
        "pool": "0x3faC21f2d59d890BA23b82028aB2B3dA8ae5A116"
    }
    model_id = 680
    version_id = 4
    chain = "ethereum:sepolia:geth"

    data = load_data()
    independent_values = data[["Electricity_day_price", 'Difficulty', 'HashRate', 'Power', 'Block Reward', 'Cost_2_months', 'Cost_3_months', 'Cost_4_months', 'Cost_5_months', 'Cost_6_months']].values
    last_value = independent_values[-1]
    model_input = last_value.reshape((10, 1))
    breakpoint()
    agent = create_agent(model_id, version_id, chain, contracts, "aidala_working")
    prediction = predict(agent, model_input)

    breakpoint()
    print(0)


if __name__ == "__main__":
    main()
