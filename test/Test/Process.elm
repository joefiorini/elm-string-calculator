module Test.Process where

import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import Test.Helpers exposing (..)
import Process exposing (..)

tests =
  suite "Process"
    [ test "calls container with empty string on NoOp"
        <| assertEqual
            default
            <| process NoOp default
    , test "calculates value on add"
        <| assertEqual
            "3"
            (.result
                  <| process (Add "1,2") default)
    , test "updates selected delimiter"
        <| assertEqual
            "|"
            (.delimiter
                <| process (ChangeDelimiter "|") default)
    , test "uses selected delimiter for calculating"
      <| assertEqual
        "3"
        (process (ChangeDelimiter "|") default
            |> process (Add "1|2") |> .result)

    ]
