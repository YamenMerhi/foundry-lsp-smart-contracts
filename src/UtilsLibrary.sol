// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "./lsp-smart-contracts/Utils/UtilsLib.sol";

contract UtilsLibrary {
    // Cheaper ways from `abi.encodePacked(arg);`
    function concatTwoBytes16(bytes16 b1, bytes16 b2)
        public
        pure
        returns (bytes memory result)
    {
        return UtilsLib.concatTwoBytes16(b1, b2);
    }

    function uint256ToBytes(uint256 num)
        public
        pure
        returns (bytes memory bytes_)
    {
        return UtilsLib.uint256ToBytes(num);
    }

    function addressToBytes(address addr)
        public
        pure
        returns (bytes memory bytes_)
    {
        return UtilsLib.addressToBytes(addr);
    }
}
