module Test.Process where

import ElmTest.Test (test, Test, suite)
import ElmTest.Assertion (assert, assertEqual)

import Test.Helpers (..)
import Process (..)

tests =
  suite "Process"
    [ test "calls container with empty string on NoOp"
        <| assertEqual
            default
            <| process default NoOp
    , test "calculates value on add"
        <| assertEqual
            "3"
            <| (.result
                  <| process default (Add "1,2"))
    , test "updates selected delimiter"
        <| assertEqual
            "|"
            <| (.delimiter
                <| process default (ChangeDelimiter "|"))
    ]
