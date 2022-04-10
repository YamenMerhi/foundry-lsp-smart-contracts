// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

// --- ERC165 interface ids
bytes4 constant _INTERFACEID_LSP6 = 0x32e6d0ab;

// --- ERC725Y Keys

// PERMISSIONS KEYS
bytes8 constant _SET_PERMISSIONS_PREFIX = 0x4b80742d00000000; // AddressPermissions:<...>

// keccak256('AddressPermissions[]')
bytes32 constant _LSP6_ADDRESS_PERMISSIONS_ARRAY_KEY = 0xdf30dba06db6a30e65354d9a64c609861f089545ca58c6b4dbe31a5f338cb0e3;

// AddressPermissions[index]
bytes16 constant _LSP6_ADDRESS_PERMISSIONS_ARRAY_KEY_PREFIX = 0xdf30dba06db6a30e65354d9a64c60986;

// bytes4(keccak256('AddressPermissions')) + bytes4(0) + bytes2(keccak256('Permissions')) + bytes2(0)
bytes12 constant _LSP6_ADDRESS_PERMISSIONS_MAP_KEY_PREFIX = 0x4b80742d0000000082ac0000; // AddressPermissions:Permissions:<address> --> bytes32

// bytes4(keccak256('AddressPermissions')) + bytes4(0) + bytes2(keccak256('AllowedAddresses')) + bytes2(0)
bytes12 constant _LSP6_ADDRESS_ALLOWEDADDRESSES_MAP_KEY_PREFIX = 0x4b80742d00000000c6dd0000; // AddressPermissions:AllowedAddresses:<address> --> address[]

// bytes4(keccak256('AddressPermissions')) + bytes4(0) + bytes2(keccak256('AllowedFunctions')) + bytes2(0)
bytes12 constant _LSP6_ADDRESS_ALLOWEDFUNCTIONS_MAP_KEY_PREFIX = 0x4b80742d000000008efe0000; // AddressPermissions:AllowedFunctions:<address> --> bytes4[]

// bytes4(keccak256('AddressPermissions')) + bytes4(0) + bytes2(keccak256('AllowedStandards')) + bytes2(0)
bytes12 constant _LSP6_ADDRESS_ALLOWEDSTANDARDS_MAP_KEY_PREFIX = 0x4b80742d000000003efa0000; // AddressPermissions:AllowedStandards:<address> --> bytes4[]

// bytes4(keccak256('AddressPermissions')) + bytes4(0) + bytes2(keccak256('AllowedERC725YKeys')) + bytes2(0)
bytes12 constant _LSP6_ADDRESS_ALLOWEDERC725YKEYS_MAP_KEY_PREFIX = 0x4b80742d0000000090b80000; // AddressPermissions:AllowedERC725YKeys:<address> --> bytes32[]

// PERMISSIONS VALUES
bytes32 constant _PERMISSION_CHANGEOWNER = 0x0000000000000000000000000000000000000000000000000000000000000001;
bytes32 constant _PERMISSION_CHANGEPERMISSIONS = 0x0000000000000000000000000000000000000000000000000000000000000002;
bytes32 constant _PERMISSION_ADDPERMISSIONS = 0x0000000000000000000000000000000000000000000000000000000000000004;
bytes32 constant _PERMISSION_SETDATA = 0x0000000000000000000000000000000000000000000000000000000000000008;
bytes32 constant _PERMISSION_CALL = 0x0000000000000000000000000000000000000000000000000000000000000010;
bytes32 constant _PERMISSION_STATICCALL = 0x0000000000000000000000000000000000000000000000000000000000000020;
bytes32 constant _PERMISSION_DELEGATECALL = 0x0000000000000000000000000000000000000000000000000000000000000040;
bytes32 constant _PERMISSION_DEPLOY = 0x0000000000000000000000000000000000000000000000000000000000000080;
bytes32 constant _PERMISSION_TRANSFERVALUE = 0x0000000000000000000000000000000000000000000000000000000000000100;
bytes32 constant _PERMISSION_SIGN = 0x0000000000000000000000000000000000000000000000000000000000000200;

bytes32 constant _ALL_DEFAULT_PERMISSIONS = 0x00000000000000000000000000000000000000000000000000000000000003ff;

bytes32 constant _ALL_EXECUTION_PERMISSIONS = bytes32(
    uint256(_ALL_DEFAULT_PERMISSIONS) - uint256(_PERMISSION_SIGN)
);

// TODO: test if gas cost difference when storing as:
// - bytes4 0x14a6e293
// - keccak256("setData(bytes32[],bytes[])")
bytes4 constant setDataMultipleSelector = 0x14a6e293;