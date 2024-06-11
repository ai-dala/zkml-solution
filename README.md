# Gizathon ZKML - Aidala

## Overview

Main goal of this project is to simplify life of bitcoin miners through the use of an ML model to predict how much BTC they need to cover their electricity costs for the next 2, 3, 4 and 5 months. The ZK part of the equation helps build trust between Aidala and bitcoin miners to prove that the same model is used for everyone and they can trade their hard mined BTC in a decentralised way. 

On the high level, BTC miners provide their BTC in the form of WBTC which is an ERC-20 token and can be traded on any decentralised exchange. We trained models to provide values for each of the time periods and use the output of the model to trade on WBTC/USDC pool on uniswap. 

The endproduct is a CLI tool which does a few things:
1) Sets up all the necessary contracts for on chain interaction
2) Runs inference on the trained models
3) Swaps WBTC for USDC

### Setup

As of today, [Giza](https://docs.gizatech.xyz/welcome/installation) works with Python 3.11.

In order to set up your environent correctly, follow the steps below:

`pyenv install 3.11.0`

`pyenv virtualenv 3.11.0 giza`

and at the root of the project `pyenv local giza`

In order to run the CLI, a `.env` file needs to be created in `agents` with the following env vars:

```
AIDALA_WORKING_PASSPHRASE=<PASSPHRASE USED WHEN CREATING AN ACCOUNT WITH APE>
SEPOLIA_RPC_URL=<YOUR RPC URL>
RECIPIENT=<ADDRESS OF AN ACCOUNT CREATED WITH APE>
```
Following this `pip install .` to install the Aidala CLI to talk to giza and run the AI agent.

For the account creation, `ape` framework handled that. In order to use aidala CLI, the account need to be funded with ETH for gas and WBTC for actual swaps. 

### Training

Here we will explore how the model was trained.

#### Dataset

Starting with the underlying data that the model was trained on. There are 3 parts to the data:
1) Electricity prices for all countries in the EU, the raw spreadsheet can be found in `model_training/data`
2) Historical BTC prices - we took it from our internal DynamoDB
3) Historical difficulties - also taken from the internal DynamoDB
4) Historical EURUSD exchange rates taken from yfinance (we are swapping WBTC for USDC and the electricity prices are in EUR)

Notebook to combine the data is in `model_training/data_preparation.py`

Unfortunately this notebook is not possible for everyone to run as it requires keys for our AWS setup. However, we can share the resulting merged data set upon request. It is too large to be uploaded on github, so if you'd like to take a look - let us know!

#### Models tried

We have trained two types of models: 
- Feed forward neural network with pytorch using google colab with GPU support. Here we saved it in ONNX and tried to transpile it but due to the size of the model which caused various issues and how long it takes to train one to overcome all the OOM issues, it was decided to try out the model from below. The notebook to train it can be found in `model_training/train_ffnn.ipynb`
- XGBoost models similar to the one from [Giza Examples](https://docs.gizatech.xyz/tutorials/zkml/verifiable-xgboost). This model was quite easy and quick to train, we also encountered size issues with this model but after a few iterations we got the size that was possible to transpile, deploy an endpoint for and run a prooving job. This model was not performing as well as Feed forward neural net but was good enough for a POC solution. The notebook for this can be found in `train_xgb.ipynb`

#### Issues encountered

Here we will discuss issues that we encountered. 

##### Large models

The first one is [failing transpilations](https://docs.gizatech.xyz/products/platform/known-limitations#transpilation-is-failing-due-to-memory) and [failing prooving jobs](https://docs.gizatech.xyz/products/platform/known-limitations#proving-job-failed). This was overcome by switching models and finding a suitable size of the model, increasing the size of a prooving job as well.

##### Serialisation of inputs

Another issue we found was that for large enough integers using XGBoost model, the predict endpoint returns a 500. More info can be found on the [Issue](https://github.com/gizatechxyz/giza-cli/issues/60).

##### Single output models

In conclusion, another limitation is that running predictions on models with more than one expected output would always return a single output. In other words, if my model needs to predict four floats, it only returns a single float.

```
Prediction 
(
    AgentResult(
        input={
            'input': array([ 5.38, 74.6 ,  8.6 , 12.2 ,  2.2 ,  3.25, 31.5 , 41.5 , 51.5 ,54.3 , 62.2 ]
            )
        }, 
        request_id=bb23f321842641a7b684815553125cae, 
        value=0.07492
    ),
)
``` 

Notice the value above will always be a single float. Hence, we had to create four different models for four dependent variables.

### On chain actions

There are 4 main contracts that are used in the tool: WBTC, USDC, uniswap swap router and uniswap pool. Firstly, it was needed to find the address of the pool. There is a script in the root of the project called `pool_address.py` which gets address of the WBTC/USDC pool to get the current state of it using the `slot0` function.

Furthermore, WBTC contract is used to approve spend by the swap router on behalf of the trader/miner address. And the swap router is used to perform the swap. Also, pool contract is used to find out the current `sqrtPriceLimitX96` which is then used in swap parameters for the swap router.

### How to use the CLI tool

After installation of the CLI tool and funding the account with WBTC and ETH on Sepolia network (example account `0xAb616594bc7BA3b3B11711718E4D9eA962Ec6f82` that we used for the demo) the following can be run:

```
aidala_agent \
    --electricity_day_price 5.38 \
    --difficulty 8.6 \
    --hash_rate 12.2 \
    --power 2.2 \
    --block_reward 3.25 \
    --cost_2_months 301.5 \
    --cost_3_months 401.5 \
    --cost_4_months 501.5 \
    --cost_5_months 504.3 \
    --cost_6_months 602.2 \
    --btc_price 74.6
```

where `electricity_day_price` is a float for how much electricity costs currently in USD per day, `difficulty` is the current bitcoin mining difficulty scaled down by 10^13 as explained above, `hash_rate` is the parameter of a mining ASIC, `power` is how much power a mining ASIC consumes in Kilo Watts, `block_reward` is the amount of BTC rewarded for block creation, `cost_<i>_months` is a trailing sum price of electricity up to this date (ie `cost_4_months` is the sum of electricity costs for the last 4 months) and `btc_price` is the current BTC price in USD scaled down by 10^3. 

Following execution of the given CLI command, two transactions should be created: one for allowance to spend WBTC on behalf of the user and the second one to actually perform a swap.

### Real-World Examples and Use Cases

1) Strategic Asset Management:
A Bitcoin miner in Norway uses Aidala to optimize investments into ASIC fleet upgrades. Predictive insights help them allocate resources to the most profitable models based on future cost and revenue forecasts at the right time.

2) Financial Planning and Market Positioning:
A mining farm in Texas uses the tool to forecast BTC requirements to cover future electricity bills. By understanding future price trends, they can make informed decisions on when to sell mined BTC, enhancing profitability.

3) Operational Efficiency:
A small-scale miner in Sweden integrates Aidala to receive alerts on future electricity price spikes. They adjust their mining intensity and energy consumption during low-cost periods, thereby maximizing efficiency and returns.

4) Risk Management:
A mining operation in Kazakhstan uses Aidala to mitigate risks associated with market fluctuations. By predicting not only energy costs but also BTC market prices and mining difficulty, they develop strategies to hedge against potential losses.

5) Decentralized Trading:
A miner in the US uses the tool to automatically convert mined BTC to WBTC and trade on decentralized exchanges. This ensures they can take advantage of favorable market conditions and manage their digital assets more effectively.

### Future works

One of the primary future goals of Aidala is to automate the process of converting mined BTC to WBTC, further streamlining operations for Bitcoin miners. 
1) Integrating Decentralized and Centralised Solutions
2) Enabling Atomic Swaps
3) Security and Compliance
By automating the conversion process, Aidala aims to reduce manual intervention, minimize third-party risk, and provide a more efficient and secure solution for Bitcoin miners to manage and optimize their digital assets.
