// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract structArray {
    
    struct Name{
        string value;
        bool enable;
    }

    Name[] public names;

    function addName(string memory _name) public {
        names.push(Name({value: _name, enable: true}));
    }

    function deleteName(string memory _deleteName) public {
        for(uint256 i = 0; i < names.length;i++){
             if (keccak256(bytes(names[i].value)) == keccak256(bytes(_deleteName))){
                names[i].enable = false;
                break;
            }
        }
    }

    function getRow(uint256 _index) public view returns (string memory, bool) {
        require(_index < names.length, "index out of range");
        return (names[_index].value, names[_index].enable);
    }

    function getArray() public view returns (Name[] memory) {
        return names;
    }
}
