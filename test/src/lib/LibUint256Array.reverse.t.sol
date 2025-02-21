// SPDX-License-Identifier: LicenseRef-DCL-1.0
// SPDX-FileCopyrightText: Copyright (c) 2020 Rain Open Source Software Ltd
pragma solidity =0.8.25;

import {Test} from "forge-std/Test.sol";
import {LibUint256Array} from "src/lib/LibUint256Array.sol";
import {LibUint256ArraySlow} from "test/lib/LibUint256ArraySlow.sol";

contract LibUint256ArrayReverseTest is Test {
    /// Test that the reverse function works as expected according to the
    /// reference implementation.
    function testReverse(uint256[] memory a) public pure {
        uint256[] memory b = new uint256[](a.length);
        for (uint256 i = 0; i < a.length; i++) {
            b[i] = a[i];
        }
        LibUint256Array.reverse(a);

        assertEq(a, LibUint256ArraySlow.reverseSlow(b));
    }

    /// Gas of reversing an empty array.
    function testReverseGas0() public pure {
        LibUint256Array.reverse(new uint256[](0));
    }

    /// Gas of reversing an array of length 1.
    function testReverseGas1() public pure {
        LibUint256Array.reverse(new uint256[](1));
    }

    /// Gas of reversing an array of length 2.
    function testReverseGas2() public pure {
        LibUint256Array.reverse(new uint256[](2));
    }

    /// Gas of reversing an array of length 3.
    function testReverseGas3() public pure {
        LibUint256Array.reverse(new uint256[](3));
    }
}
