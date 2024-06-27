// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenGamingToken is ERC20 {

    address private owner;
    constructor() ERC20("Degen Gaming Token", "DGT"){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner,"You are not the owner");
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner{
        _mint(to, amount);
    }

    function redeem(uint256 amount) external {
        //_burn(msg.sender, amount);
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to redeem");
        _transfer(msg.sender, owner, amount);
       
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transferToken(address _reciever , uint256 amount) external {
        require(balanceOf(msg.sender) >= amount , "You don'thave enough degen tokens to transfer");
        approve(msg.sender, amount);
        transferFrom(msg.sender , _reciever , amount);
    }
    function getBalance() external view returns(uint256) {
        return this.balanceOf(msg.sender);
    }
 }