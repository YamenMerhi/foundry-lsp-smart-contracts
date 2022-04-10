// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../LSP2Library.sol";
import "solidity-bytes-utils/contracts/BytesLib.sol";

contract LSP2LibraryTest is DSTest {
    LSP2Library public lsp2Lib;

    function setUp() public {
        lsp2Lib = new LSP2Library();
    }

    function test_generateArrayKeyAtIndex(bytes32 arrayKey, uint256 index)
        public
    {
        bytes32 usingLSP2lib = lsp2Lib.generateArrayKeyAtIndex(arrayKey, index);
        bytes memory rawKey = abi.encodePacked(
            bytes16(arrayKey),
            bytes16(uint128(index))
        );
        bytes32 key = BytesLib.toBytes32(rawKey, 0);
        assertEq32(key, usingLSP2lib);
    }

    function test_generateBytes20MappingWithGroupingKey(
        bytes12 prefix,
        bytes20 _bytes20,
        string memory firstWord,
        string memory secondWord,
        address addr
    ) public {
        bytes32 LSP2libFirstFunction = lsp2Lib
            .generateBytes20MappingWithGroupingKey(prefix, _bytes20);

        bytes32 LSP2libSecondFunction = lsp2Lib
            .generateBytes20MappingWithGroupingKey(firstWord, secondWord, addr);
        assertEq32(LSP2libFirstFunction, LSP2libSecondFunction);
    }
}
