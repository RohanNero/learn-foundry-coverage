// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    /**@notice this function will not catch the bug */
    // function testDecrement_Vulnerable() public {
    //     counter.increment(); 
    //     counter.decrement();
    //     assertEq(counter.number(),0);
    // }

    /**
    *@notice this function will catch ze bug */ 
    // function testDecrement_OnSteroids(uint256 x) public {
    //     x = bound(x,0,2**256-1);
    //     counter.setNumber(x);
    //     counter.decrement();
    //     assertEq(counter.number(),x-1);
    // }

}
