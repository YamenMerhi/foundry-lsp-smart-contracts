// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "../Utils/UtilsLib.sol";

/**
 * @title ERC725 Utility library to encode key types
 * @author Jean Cavallera (CJ-42)
 * @dev based on LSP2 - ERC725Y JSON Schema
 *      https://github.com/lukso-network/LIPs/blob/master/LSPs/LSP-2-ERC725YJSONSchema.md
 */
library LSP2Utils {
    /* solhint-disable no-inline-assembly */

    function generateBytes32Key(bytes memory _rawKey)
        internal
        pure
        returns (bytes32 key)
    {
        // solhint-disable-next-line
        assembly {
            key := mload(add(_rawKey, 32))
        }
    }

    function generateSingletonKey(string memory _keyName)
        internal
        pure
        returns (bytes32)
    {
        return keccak256(bytes(_keyName));
    }

    function generateArrayKey(string memory _keyName)
        internal
        pure
        returns (bytes32)
    {
        bytes memory keyName = bytes(_keyName);

        // prettier-ignore
        require(
            keyName[keyName.length - 2] == 0x5b && // "[" in utf8 encoded
                keyName[keyName.length - 1] == 0x5d, // "]" in utf8
            "Missing empty square brackets \"[]\" at the end of the key name"
        );

        return keccak256(keyName);
    }

    function generateArrayKeyAtIndex(bytes32 _arrayKey, uint256 _index)
        internal
        pure
        returns (bytes32)
    {
        bytes memory elementInArray = UtilsLib.concatTwoBytes16(
            bytes16(_arrayKey),
            bytes16(uint128(_index))
        );
        return generateBytes32Key(elementInArray);
    }

    function generateMappingKey(
        string memory _firstWord,
        string memory _lastWord
    ) internal pure returns (bytes32) {
        bytes32 firstWordHash = keccak256(bytes(_firstWord));
        bytes32 lastWordHash = keccak256(bytes(_lastWord));

        bytes memory temporaryBytes = abi.encodePacked(
            bytes16(firstWordHash),
            bytes12(0),
            bytes4(lastWordHash)
        );

        return generateBytes32Key(temporaryBytes);
    }

    function generateBytes20MappingKey(
        string memory _firstWord,
        address _address
    ) internal pure returns (bytes32) {
        bytes32 firstWordHash = keccak256(bytes(_firstWord));

        bytes memory temporaryBytes = abi.encodePacked(
            bytes8(firstWordHash),
            bytes4(0),
            _address
        );

        return generateBytes32Key(temporaryBytes);
    }

    function generateBytes20MappingWithGroupingKey(
        string memory _firstWord,
        string memory _secondWord,
        address _address
    ) internal pure returns (bytes32) {
        bytes32 firstWordHash = keccak256(bytes(_firstWord));
        bytes32 secondWordHash = keccak256(bytes(_secondWord));

        bytes memory temporaryBytes = abi.encodePacked(
            bytes4(firstWordHash),
            bytes4(0),
            bytes2(secondWordHash),
            bytes2(0),
            _address
        );

        return generateBytes32Key(temporaryBytes);
    }

    function generateBytes20MappingWithGroupingKey(
        bytes12 _keyPrefix,
        bytes20 _bytes20
    ) internal pure returns (bytes32) {
        bytes memory generatedKey = bytes.concat(_keyPrefix, _bytes20);
        return generateBytes32Key(generatedKey);
    }

    function generateJSONURLValue(
        string memory _hashFunction,
        string memory _json,
        string memory _url
    ) internal pure returns (bytes memory key_) {
        bytes32 hashFunctionDigest = keccak256(bytes(_hashFunction));
        bytes32 jsonDigest = keccak256(bytes(_json));

        key_ = abi.encodePacked(bytes4(hashFunctionDigest), jsonDigest, _url);
    }

    function generateASSETURLValue(
        string memory _hashFunction,
        string memory _assetBytes,
        string memory _url
    ) internal pure returns (bytes memory key_) {
        bytes32 hashFunctionDigest = keccak256(bytes(_hashFunction));
        bytes32 jsonDigest = keccak256(bytes(_assetBytes));

        key_ = abi.encodePacked(bytes4(hashFunctionDigest), jsonDigest, _url);
    }
}
