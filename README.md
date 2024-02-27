![Starkbyte_Logo](https://github.com/TechieTeee/StarkByte/assets/100870737/d75d0e48-5860-4c99-930d-86e13bf33c9b)
# StarkByte

## Overview
StarkByte is an exploration project that delves into the realms of Internet of Things (IoT), edge computing, StarkNet, and the Cairo programming language. The repository serves as a customized contract development environment for StarkNet. While many commands are automated through .zsh scripts, it's essential to note that the console and standard `starknet` commands are still fully available for manual use.

## Background
In the burgeoning landscape of cloud computing and big data, StarkByte stands poised to thrive in the anticipated $349.56 billion industry of 2024. The project strategically integrates edge computing, IoT, and the revolutionary blockchain technology StarkNet, presenting a transformative synergy.

## Tools
StarkByte leverages various tools and technologies to achieve its objectives:

- **StarkNet:** A blockchain platform for building scalable decentralized applications (DApps) using the Cairo programming language.
  
- **Cairo:** A high-level programming language designed for developing smart contracts on the StarkNet blockchain.

- **Argent + Braavos:** Starknet Smart Wallet Sign In

- **Zsh Scripts:** The project utilizes custom .zsh scripts for automating repetitive tasks and streamlining the development process.

## Use Cases
StarkByte addresses several critical use cases in the realm of decentralized compute and blockchain technology:

- **Real-time Processing:** Leveraging edge computing for real-time data processing and analysis.

- **Comprehensive Data Collection:** Utilizing IoT devices for extensive and reliable data collection.

- **Security and Transparency:** Harnessing blockchain technology to enhance security and transparency in data transactions.

- **Optimized Resource Allocation:** Implementing innovative approaches to optimize resource allocation in decentralized solutions.


## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


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

# First Successful Deployment (Remote Devnet)
![image](https://github.com/TechieTeee/StarkByte/assets/100870737/527cb095-b980-4838-8700-d0e6d5346b62)

![image](https://github.com/TechieTeee/StarkByte/assets/100870737/47cb9f32-4e6a-4a24-a210-7385c7d38305)

# Second Successful Deployment (Goerli Testnet)
![image](https://github.com/TechieTeee/StarkByte/assets/100870737/0f8cecb8-c7f9-48c0-90bc-6c145ca87605)

