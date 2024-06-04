from web3 import Web3


factory_abi = [
    {
        "inputs": [
            {"internalType": "address", "name": "tokenA", "type": "address"},
            {"internalType": "address", "name": "tokenB", "type": "address"},
            {"internalType": "uint24", "name": "fee", "type": "uint24"},
        ],
        "name": "getPool",
        "outputs": [{"internalType": "address", "name": "pool", "type": "address"}],
        "stateMutability": "view",
        "type": "function",
    }
]

pool_abi = [
  {
    "constant": True,
    "inputs": [],
    "name": "slot0",
    "outputs": [
      {
        "internalType": "uint160",
        "name": "sqrtPriceX96",
        "type": "uint160"
      },
      {
        "internalType": "int24",
        "name": "tick",
        "type": "int24"
      },
      {
        "internalType": "uint16",
        "name": "observationIndex",
        "type": "uint16"
      },
      {
        "internalType": "uint16",
        "name": "observationCardinality",
        "type": "uint16"
      },
      {
        "internalType": "uint16",
        "name": "observationCardinalityNext",
        "type": "uint16"
      },
      {
        "internalType": "uint8",
        "name": "feeProtocol",
        "type": "uint8"
      },
      {
        "internalType": "bool",
        "name": "unlocked",
        "type": "bool"
      }
    ],
    "payable": False,
    "stateMutability": "view",
    "type": "function"
  }
]

infura_url = "https://sepolia.infura.io/v3/8ef2abc2fcac40fdad51d7891ae4bee5"
web3 = Web3(Web3.HTTPProvider(infura_url))

if web3.is_connected():
    print("Connected to Ethereum")
else:
    print("Failed to connect")

factory_address = (
    "0x0227628f3F023bb0B980b67D528571c95c6DaC1c"  # Uniswap V3 factory address
)
factory_contract = web3.eth.contract(address=factory_address, abi=factory_abi)


def get_uniswap_v3_pool_address(tokenA, tokenB, fee):
    try:
        tokenA = Web3.to_checksum_address(tokenA)
        tokenB = Web3.to_checksum_address(tokenB)
        pool_address = factory_contract.functions.getPool(tokenA, tokenB, fee).call()
        return pool_address
    except Exception as e:
        return f"Error fetching pool address: {str(e)}"


# Example usage:
tokenA = "0x29f2D40B0605204364af54EC677bD022dA425d03"  # WBTC
tokenB = "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8"  # USDC
fee = 3000  # Fee tier (e.g., 3000 for 0.3%)

pool_address = get_uniswap_v3_pool_address(tokenA, tokenB, fee)
print(f"The pool address is: {pool_address}")

pool_contract = web3.eth.contract(address=pool_address, abi=pool_abi)
slot0_data = pool_contract.functions.slot0().call()
print(f"Slot0 data: {slot0_data}")