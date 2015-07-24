module Test.Parser where

import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import Test.Helpers exposing (..)
import Parser

tests =
  suite "Parser"
    [ test "Returns empty array for empty string"
        <| assertEqual []
        <| Parser.parse ""
    , test "Returns single element array with 1 integer"
        <| assertEqual [1]
        <| Parser.parse "1"
    , test "Returns empty list with non-integer"
        <| assertEqual []
        <| Parser.parse "a"
    , test "Returns list of integers split up on ,"
        <| assertEqual [1,2]
        <| Parser.parse "1,2"
    , test "Allows specifying a delimiter"
        <| assertEqual [1,2]
        <| Parser.parseDelim "|" "1|2"
    ]
