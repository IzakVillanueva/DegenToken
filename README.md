# DegenToken

This smart contract implements several functions and publishes a coin in the testnet of Snowtrace. Users can try out the functions written in the DegenToken.sol and they can see real time updates on snowtrace testnet.

## Description
![image](https://github.com/user-attachments/assets/7604f27c-5d5b-411c-9f4e-981c4cf39b8a)
![image](https://github.com/user-attachments/assets/5fc50df4-1096-4d5e-b1d4-b8c40ba07a2f)

This solidity code makes use of ERC20 to create Degen Tokens for Degen Gaming. It makes use of Metamask to connect the Remix IDE to Snowtrace. In doing so, we can see realtime updates on the transactions that we do in real time. Only the owner of the contract can mint Degen Tokens, but any user can transfer, burn, check their balance, and also redeem some in-game items/merch from the store.

## Getting Started

### Installing

* Go to the **contracts** folder and open **DegenToken.sol**.
* Open Remix IDE and paste all the contents of **DegenToken.sol** in a new file. (https://remix.ethereum.org/)

### Executing program

![image](https://github.com/user-attachments/assets/39baf909-2758-4cbc-8b62-299db942ed6f)
* Under the Solidity Compiler tab in the left navbar, make sure the EVM version is either **istanbul** or **berlin** for the right compatibility.
* Click the blue button to compile the DegenToken.sol

![image](https://github.com/user-attachments/assets/14a3f16b-8e7d-47b5-815f-642e2e399c83)
* Under Deploy and Run Transactions in the left navbar, select **Injected Provider - Metamask** as the environment and connect your metamask account.
* Make sure that the metamask account connected has some AVAX stored.
* Click the orange button to Deploy the contract.
* Copy the contract address after deploying.
* Go to Snowtrace Testnet and paste the contract address. (https://testnet.snowtrace.io/)

![image](https://github.com/user-attachments/assets/9cb90789-0c0b-4272-9902-c3d0d11526bf)
As an example, this is the Snowtrace Testnet Transaction history as proof for this project. (https://testnet.snowtrace.io/address/0x12cB630Ce69a22548c4506e93c02c442433bAd50)

## Functions

```mintTokens``` mints tokens to a specified address. Only the owner is allowed to access this function.
```checkBalance``` returns the balance of the current user.
```browseMerch``` lists all the available items to redeem in the merch store.
```redeemTokens``` lets the user redeem the merch of the given user input(uint).
```transfer``` allows the user to transfer tokens to a specified address.
```burnTokens``` burns the specified number of tokens from the users current balance.

## Authors

Izak

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
