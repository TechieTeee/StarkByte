# StarkByte
Exploration of IOT, edge computing, Starknet and Cairo

This repository is a customized contract development environment for Starknet. Most commands are automated and written in .zsh scripts, but this does not change the fact that you can still use the console and standard `starknet` commands.

# Setup
To work inside docker contaiiner:
1. Open project in <a href="https://code.visualstudio.com/docs/devcontainers/tutorial">Dev Container</a> 
2. Install dependencies with `npm i`

<i>To check that the container is working properly</i>: inside container, open terminal, run:

 `starknet -v`, 

Command should work and print

`starknet 0.11.1.1`

# Env
All environment variables, folder settings, network settings, etc. are in the `<project_root>/commands/common/env.zsh` file. The default setting is the `alpha-goerli` network and the standard settings of the project.

# Links
1. <a href="https://www.cairo-lang.org/docs/hello_starknet/index.html">Hello, StarkNet</a>
2. <a href="https://www.cairo-lang.org/docs/hello_starknet/account_setup.html#creating-an-account">Create account</a>
2. <a href="https://www.cairo-lang.org/docs/hello_starknet/unit_tests.html">Unit tests</a>


# Account creation
1. Run `./commands/common/account/create.zsh`. This command will create account with name `account_1` in `accounts` folder.
2. Go to <a href="https://faucet.goerli.starknet.io/">faucet</a>, and increase your balance.
3. Deploy your account with command `./commands/common/account/deploy.zsh`
4. Information about created accounts can be found in the `accounts` folder

# Contracts
*All network commands require an account to be created
### Compilation
Run `npm run compile` to compile all contracts inside `/contracts` folder. This command create two folder with compilation result, `abis` and `compiled`.
### Declare contract in network
Run `./commands/contract_declare.zsh` to declare contract class in network.
### Deploy contract to network
Run `./commands/contract_deploy.zsh` to declare contract class in network. Change class hash in file before execute.

# Tests
Implemented a basic example of contract testing


Run `npm run test`

# Custom Typescript
Run, for example, `npx ts-node scripts/index.ts`. I allow to get chainId from blockchain.

# First Successful Deployment
![image](https://github.com/TechieTeee/StarkByte/assets/100870737/527cb095-b980-4838-8700-d0e6d5346b62)

![image](https://github.com/TechieTeee/StarkByte/assets/100870737/47cb9f32-4e6a-4a24-a210-7385c7d38305)

------------------------ Declaring contract: starkbyte.cairo ------------------------
{
  "transaction_hash": "0xdc2032b6f4d002d5c342b22154604550bf152de5b3c09a8c4bd732dfc1311",
  "class_hash": "0x68a1dab5811425ef69fe42ad3e384b63081b0c5ca64f12d00d4b1c2c6a090c"
}
---------------------- End Declaring contract: starkbyte.cairo ----------------------
--------------------- Getting declare contract: starkbyte.cairo tx receipt --------------------
{
  "type": "DECLARE",
  "transaction_hash": "0xdc2032b6f4d002d5c342b22154604550bf152de5b3c09a8c4bd732dfc1311",
  "actual_fee": "0x1509a9f080800",
  "messages_sent": [],
  "events": [
    {
      "from_address": "0x49d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7",
      "keys": [
        "0x99cd8bde557814842a3121e8ddfd433a539b8c9f14bf31ebf108d12e6196e9"
      ],
      "data": [
        "0x6b0ee6f418e47408cf56c6f98261c1c5693276943be12db9597b933d363df",
        "0x1000",
        "0x1509a9f080800",
        "0x0"
      ]
    }
  ],
  "execution_status": "SUCCEEDED",
  "finality_status": "ACCEPTED_ON_L2",
  "block_hash": "0x31156508cc625f9826345779fd549272cae9ad7c6e29b02eda3f8f89a8650ed",
  "block_number": 191,
  "execution_resources": {
    "steps": "0xb2e",
    "memory_holes": "0x28",
    "range_check_builtin_applications": "0x3f",
    "pedersen_builtin_applications": "0xf",
    "poseidon_builtin_applications": "0x0",
    "ec_op_builtin_applications": "0x0",
    "ecdsa_builtin_applications": "0x1",
    "bitwise_builtin_applications": "0x0",
    "keccak_builtin_applications": "0x0"
  }
}
--------------------- End getting declare contract: starkbyte.cairo tx receipt ------------------
------------------------ Deploying contract: starkbyte.cairo ------------------------
{
  "transaction_hash": "0x24e124f95ead5a142705fc7686a931fc9332fa27d75867b70b80993e865210b",
  "contract_address": [
    "0xdb7a699245ab2088acadce9a109ca3db4ea7a81e07e4ad80bb7e3c2bad0043"
  ]
}
---------------------- End Deploying contract: starkbyte.cairo ----------------------
--------------------- Getting deploy contract: starkbyte.cairo tx receipt --------------------
{
  "type": "DEPLOY",
  "transaction_hash": "0x24e124f95ead5a142705fc7686a931fc9332fa27d75867b70b80993e865210b",
  "actual_fee": "0x18acfc84c0800",
  "messages_sent": [],
  "events": [
    {
      "from_address": "0x41a78e741e5af2fec34b695679bc6891742439f7afb8484ecd7766661ad02bf",
      "keys": [
        "0x26b160f10156dea0639bec90696772c640b9706a47f5b8c52ea1abe5858b34d"
      ],
      "data": [
        "0xdb7a699245ab2088acadce9a109ca3db4ea7a81e07e4ad80bb7e3c2bad0043",
        "0x6b0ee6f418e47408cf56c6f98261c1c5693276943be12db9597b933d363df",
        "0x1",
        "0x68a1dab5811425ef69fe42ad3e384b63081b0c5ca64f12d00d4b1c2c6a090c",
        "0x0",
        "0x6f4c339dd2338a6ee829e92f734fab5a4c9b58a27058c5b8561b6cf8808225e"
      ]
    },
    {
      "from_address": "0x49d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7",
      "keys": [
        "0x99cd8bde557814842a3121e8ddfd433a539b8c9f14bf31ebf108d12e6196e9"
      ],
      "data": [
        "0x6b0ee6f418e47408cf56c6f98261c1c5693276943be12db9597b933d363df",
        "0x1000",
        "0x18acfc84c0800",
        "0x0"
      ]
    }
  ],
  "execution_status": "SUCCEEDED",
  "finality_status": "ACCEPTED_ON_L2",
  "block_hash": "0x57c32b481a1020f3b767710e042988525cd0b08dc51041694c49a62f2d8f887",
  "block_number": 192,
  "execution_resources": {
    "steps": "0x161e",
    "memory_holes": "0x35",
    "range_check_builtin_applications": "0x80",
    "pedersen_builtin_applications": "0x18",
    "poseidon_builtin_applications": "0x0",
    "ec_op_builtin_applications": "0x0",
    "ecdsa_builtin_applications": "0x1",
    "bitwise_builtin_applications": "0x0",
    "keccak_builtin_applications": "0x0"
  },
  "contract_address": "0xdb7a699245ab2088acadce9a109ca3db4ea7a81e07e4ad80bb7e3c2bad0043"
}
--------------------- End getting deploy contract: starkbyte.cairo tx receipt ------------------



