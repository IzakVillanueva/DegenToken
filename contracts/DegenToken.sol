/*
Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20{
    address private origOwner;

    constructor() ERC20("Degen", "DGN"){
        origOwner = msg.sender;
    }

    function mintTokens(address to, uint256 amount) public {
        require(msg.sender == origOwner, "You are not authorized to mint Degen Tokens!");

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

    function browseItems() public pure returns(string memory){
        string memory items = "Degen NFT Merch Store! 1. Official Degen NFT Jersey 2. Official Degen NFT Coin Figure 3. Official Degen NFT Cap";

        return items;
    }

    function redeemTokens(uint8 choice) public{
        if(choice == 1){
            require(balanceOf(msg.sender) >= 20, "You do not have enough Degen Tokens");
            _burn(msg.sender, 20);
        } else if(choice == 2){
            require(balanceOf(msg.sender) >= 15, "You do not have enough Degen Tokens");
            _burn(msg.sender, 15);
        } else if(choice == 3){
            require(balanceOf(msg.sender) >= 12, "You do not have enough Degen Tokens");
            _burn(msg.sender, 12);
        }
    }
}
