// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DecentralisedLibrary} from "../src/DecentralisedLibrary.sol";

contract DecentralisedLibraryScript is Script {
    DecentralisedLibrary public _DecentralisedLibrary;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        vm.stopBroadcast();
    }
}
