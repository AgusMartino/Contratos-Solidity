// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract EducacionITCoin {
    uint256 private _emision;
    address private _Creador;
    mapping(address => uint256) private _balances;
    
    constructor (uint256 emision){
        _emision = emision;
        _Creador = msg.sender;
        _balances[_Creador] = _emision;
    }

    
    function EnviarFondos(address destino, uint256 fondo) public soloCreador{
        _balances[_Creador] = _balances[_Creador] - fondo;
        _balances[destino] = fondo;
    }

    modifier soloCreador(){
        require(msg.sender == _Creador, "Solo el creador puede llamar a esta funcion");
        _;
    }

}