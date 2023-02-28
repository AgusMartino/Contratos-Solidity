// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract simple {
    string[] public row;

    function addName(string memory _newName) public {
        row.push(_newName);
    }

    function deleteName1(string memory _deleteName) public payable {
        for(uint256 i = 0;i <= row.length; i++){
            if (keccak256(bytes(row[i])) == keccak256(bytes(_deleteName))){
                delete row[i];
            }
        }
    }

    function deleteName2(string memory _deleteName) public payable {
        for(uint256 i = 0;i <= row.length; i++){
            if (keccak256(bytes(row[i])) == keccak256(bytes(_deleteName))){
                if(i != row.length - 1){
                    row[i] = row[row.length - 1];
                }
                row.pop();
                break;
            }
        }
    }

    function getRow() public view returns (uint256[] memory, string[] memory) {
        
        //Arreglos temporales de los indices y valores del array
        uint256[] memory indices = new uint256[](row.length);
        string[] memory values = new string[](row.length);

        // Se recorre el Array original y se van guardando los indices y valores en los arreglos remporales    
        for(uint256 i = 0; i < row.length; i++){
            indices[i] = i;
            values[i] = row[i];
        }

        return (indices, values);
    }

    function getArr() public view returns (string[] memory) {
        return row;
    }
}