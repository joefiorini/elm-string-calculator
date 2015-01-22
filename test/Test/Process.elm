module Test.Process where

import ElmTest.Test (test, Test, suite)
import ElmTest.Assertion (assert, assertEqual)

import Test.Helpers (..)
import Process (..)

tests =
  suite "Process"
    [ test "calls container with empty string on NoOp"
        <| assertEqual
            ""
            <| process (\v -> v) NoOp
    , test "calculates value on add"
        <| assertEqual
            "3"
            <| process (\v -> v) (Add "1,2")
    ]
