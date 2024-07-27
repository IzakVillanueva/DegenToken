/*
Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable{

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    function mintTokens(address to, uint256 amount) public onlyOwner{
        _mint(to, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        approve(msg.sender, amount);
        return super.transfer(recipient, amount);
    }

    function burnTokens(uint256 amount) public{
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        _burn(msg.sender, amount);
    }

    function checkBalance() public view returns(uint256){
        return balanceOf(msg.sender);
    }

    function browseMerch() public pure returns(string memory items){
        items = "Welcome to Degen Merch Store~! 1. Official Degen NFT Jersey 2. Official Degen NFT Coin Figure 3. Official Degen NFT Cap";
        return items;
    }

    function redeemTokens(uint choice) public{
        string memory merch;
        uint256 price;
        if(choice == 1){
            require(balanceOf(msg.sender) >= 20, "You do not have enough Degen Tokens");
            price = 20;
            merch = "Official Degen NFT Jersey";
        } else if(choice == 2){
            require(balanceOf(msg.sender) >= 15, "You do not have enough Degen Tokens");
            price = 15;
            merch = "Official Degen NFT Coin Figure";
        } else if(choice == 3){
            require(balanceOf(msg.sender) >= 8, "You do not have enough Degen Tokens");
            price = 8;
            merch = "Official Degen NFT Cap";
        }
        _burn(msg.sender, price);
        emit RedeemedMerch(_msgSender(), choice, merch);
    }

    event RedeemedMerch(
        address indexed user,
        uint256 indexed choice,
        string merch
    );
}
