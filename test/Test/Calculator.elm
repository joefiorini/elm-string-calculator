module Test.Calculator where

import ElmTest.Test (test, Test, suite)
import ElmTest.Assertion (assert, assertEqual)

import Test.Helpers (..)
import Calculator

tests =
  suite "Calculator"
    [ test "Returns 0 with no numbers"
        <| assertEqual 0
        <| Calculator.add []
    , test "Returns passed number with only 1 number"
        <| assertEqual 1
        <| Calculator.add [1]
    , test "Returns sum of 2 numbers"
        <| assertEqual 2
        <| Calculator.add [1,1]
    , test "Returns sum of 3 or more numbers"
        <| assertEqual 3
        <| Calculator.add [1,1,1]
    ]
