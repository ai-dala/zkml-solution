from pandas import DataFrame, read_csv, to_datetime
import boto3
import os


def load_electricity() -> DataFrame:
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(current_dir, "data", "electricity_costs.csv")

    return DataFrame(read_csv(file_path))


def load_btc_prices() -> DataFrame:
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("asics-dynamodb-PricesTable-1LXU143BUOBN")
    response = table.scan()
    items = response["Items"]
    df = DataFrame(items)
    df["Date"] = to_datetime(df["Date"])
    df["Date"] = df["Date"].dt.strftime("%Y-%m-%d")
    df.sort_values(by="Date", inplace=True)
    return df


def load_difficulties() -> DataFrame:
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("asics-dynamodb-DifficultyTable-DQ308ID3POT6")
    response = table.scan()
    items = response["Items"]
    df = DataFrame(items)
    df.sort_values(by="Date", inplace=True)
    return df


electricity = load_electricity()
btc_prices = load_btc_prices()
difficulties = load_difficulties()

# Join dataframes by Date
merged_df = electricity.merge(btc_prices, on="Date")
merged_df = merged_df.merge(difficulties, on="Date")

print(0)
