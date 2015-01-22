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
