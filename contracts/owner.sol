// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ContratoProtegido is Ownable {

    uint256 private balance = 3 ether;

    function getBalance() public view onlyOwner returns (uint256) {

        return balance;

    }

}