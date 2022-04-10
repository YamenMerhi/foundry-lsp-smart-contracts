// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "./lsp-smart-contracts/LSP2ERC725YJSONSchema/LSP2Utils.sol";

contract LSP2Library {
    function generateBytes32Key(bytes memory rawKey)
        public
        pure
        returns (bytes32)
    {
        return LSP2Utils.generateBytes32Key(rawKey);
    }

    function generateSingletonKey(string memory keyName)
        public
        pure
        returns (bytes32)
    {
        return LSP2Utils.generateSingletonKey(keyName);
    }

    function generateArrayKey(string memory keyName)
        public
        pure
        returns (bytes32)
    {
        return LSP2Utils.generateArrayKey(keyName);
    }

    function generateArrayKeyAtIndex(bytes32 arrayKey, uint256 index)
        public
        pure
        returns (bytes32)
    {
        return LSP2Utils.generateArrayKeyAtIndex(arrayKey, index);
    }

    function generateMappingKey(string memory firstWord, string memory lastWord)
        public
        pure
        returns (bytes32)
    {
        return LSP2Utils.generateMappingKey(firstWord, lastWord);
    }

    function generateBytes20MappingKey(string memory firstWord, address addr)
        public
        pure
        returns (bytes32)
    {
        return LSP2Utils.generateBytes20MappingKey(firstWord, addr);
    }

    function generateBytes20MappingWithGroupingKey(
        string memory firstWord,
        string memory secondWord,
        address addr
    ) public pure returns (bytes32) {
        return
            LSP2Utils.generateBytes20MappingWithGroupingKey(
                firstWord,
                secondWord,
                addr
            );
    }

    function generateBytes20MappingWithGroupingKey(
        bytes12 keyPrefix,
        bytes20 _bytes20
    ) public pure returns (bytes32) {
        return
            LSP2Utils.generateBytes20MappingWithGroupingKey(
                keyPrefix,
                _bytes20
            );
    }

    function generateJSONURLValue(
        string memory _hashFunction,
        string memory _json,
        string memory _url
    ) public pure returns (bytes memory key_) {
        return LSP2Utils.generateJSONURLValue(_hashFunction, _json, _url);
    }

    function generateASSETURLValue(
        string memory _hashFunction,
        string memory _assetBytes,
        string memory _url
    ) public pure returns (bytes memory key_) {
        return
            LSP2Utils.generateASSETURLValue(_hashFunction, _assetBytes, _url);
    }
}
