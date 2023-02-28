// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract LiderSeguro is Ownable{
    address public liderDelContrato;
    uint256 public apuestaMaxima;

    mapping (address => uint256) transferenciasPendientes;

    constructor() payable {
        liderDelContrato = msg.sender;
        apuestaMaxima = msg.value;
    }

    function convertirseEnLider() public onlyOwner payable{
        require(msg.value > apuestaMaxima, "Monto Insuficiente");
        transferenciasPendientes[liderDelContrato] += msg.value;
        liderDelContrato = msg.sender;
        apuestaMaxima = msg.value;
    }

    function SaldarDeudas() public {
        uint256 monto = transferenciasPendientes[msg.sender];
        transferenciasPendientes[msg.sender] = 0;
        payable(msg.sender).transfer(monto);
    }

}