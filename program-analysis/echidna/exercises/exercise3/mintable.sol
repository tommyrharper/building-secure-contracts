// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import "./token.sol";

contract MintableToken is Token {
    uint public totalMinted;
    uint public totalMintable;

    constructor(uint totalMintable_) {
        totalMintable = totalMintable_;
    }

    function mint(uint value) public onlyOwner {
        require(value + totalMinted < totalMintable);
        totalMinted += value;

        balances[msg.sender] += value;
    }
}
