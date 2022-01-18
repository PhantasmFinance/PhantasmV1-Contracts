// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "ds-test/test.sol";
import {SpookySwapper} from "../SpookySwap.sol";
import {IERC20} from "../interfaces/IERC20.sol";


contract SpookySwapperTest is DSTest {
    function setUp() public {
        SpookySwapper testSwapper = new SpookySwapper();
    }

    function testRouteThroughTokens() public {
        address TOMB = 0x6c021ae822bea943b2e66552bde1d2696a53fbb7;
        address DAI = 0x8d11ec38a3eb5e956b052f67da8bdc9bef8abf3e;

        IERC20(DAI).transfer(address(testSwapper), 100000);
        // Swap(address _tokenIn, address _tokenOut, uint _amountIn, uint _amountOutMin, address _to) 
        testSwapper.swap(0x8d11ec38a3eb5e956b052f67da8bdc9bef8abf3e, 0x6c021ae822bea943b2e66552bde1d2696a53fbb7, 100000, 0, address(this));
        assertTrue(TOMB.balanceOf(address(this)) > 0);
    }
}
