from pandas import DataFrame, read_csv, to_datetime
import boto3


def load_electricity() -> DataFrame:
    return DataFrame(read_csv('./data/electricity_costs.csv'))


def load_btc_prices() -> DataFrame:
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('asics-dynamodb-PricesTable-1LXU143BUOBN')
    response = table.scan()
    items = response['Items']
    df = DataFrame(items)
    df["Date"] = to_datetime(df["Date"])
    df['Date'] = df['Date'].dt.strftime('%Y-%m-%d')
    df.sort_values(by='Date', inplace=True)
    return df


def load_difficulties() -> DataFrame:
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('asics-dynamodb-DifficultyTable-DQ308ID3POT6')
    response = table.scan()
    items = response['Items']
    df = DataFrame(items)
    df.sort_values(by='Date', inplace=True)
    return df


electricity = load_electricity()
btc_prices = load_btc_prices()
difficulties = load_difficulties()
breakpoint()
print(0)