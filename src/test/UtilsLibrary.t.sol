// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../UtilsLibrary.sol";

contract UtilsLibraryTest is DSTest {
    UtilsLibrary public utilsLib;

    function setUp() public {
        utilsLib = new UtilsLibrary();
    }

    // Testing against `abi.encodePacked(arg);`

    function test_concatTwoBytes16(bytes16 b1, bytes16 b2) public {
        bytes memory result = utilsLib.concatTwoBytes16(b1, b2);
        assertEq0(result, abi.encodePacked(b1, b2));
    }

    function test_uint256ToBytes(uint256 num) public {
        bytes memory result = utilsLib.uint256ToBytes(num);
        assertEq0(result, abi.encodePacked(num));
    }

    function test_addressToBytes(address addr) public {
        bytes memory result = utilsLib.addressToBytes(addr);
        assertEq0(result, abi.encodePacked(addr));
    }
}
