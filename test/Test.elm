module Main where

import String

import IO.IO (..)
import IO.Runner (Request, Response, run)

import ElmTest.Test (Test, suite)
import ElmTest.Runner.Console (runDisplay)

import Test.Calculator as Calculator
import Test.Parser as Parser

tests : Test
tests = suite "TodoTDD Tests"
        [ Calculator.tests
        , Parser.tests
        ]

port requests : Signal Request
port requests = run responses (runDisplay tests)

port responses : Signal Response
