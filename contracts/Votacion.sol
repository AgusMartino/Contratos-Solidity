// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Votacion {

    struct OpcionVoto {
        string nombre;
        uint256 votos;
    }

    OpcionVoto[] public opcionesvoto;

    mapping(address => bool) public haVotado; //almacena si un address emitio el voto

    function agregarOpcionVoto(string memory _nombre) public {
        opcionesvoto.push(OpcionVoto(_nombre, 0));
    }

    function votar(uint256 _indiceOpcionVoto) public {
        require(_indiceOpcionVoto < opcionesvoto.length, "Indice de opcion de voto invalido");
        require(!haVotado[msg.sender], "ya has votado");

        opcionesvoto[_indiceOpcionVoto].votos++;
        haVotado[msg.sender] = true;
    }

    function obtenerOpcionesVoto() public view returns (string[] memory, uint256[] memory) {
        uint256 numOpciones = opcionesvoto.length;
        string[] memory nombres = new string[](numOpciones);
        uint256[] memory votos = new uint256[](numOpciones);

        for(uint256 i = 0; i < numOpciones; i++) {
            OpcionVoto memory opcion = opcionesvoto[i]; //Obtiene la opcion de voto actual
            nombres[i] = opcion.nombre;
            votos[i] = opcion.votos;
            
        }
        return (nombres, votos);
    }
}