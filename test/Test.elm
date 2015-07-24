module Main where

import String

import IO.IO exposing (..)
import IO.Runner exposing (Request, Response, run)

import ElmTest.Test exposing (Test, suite)
import ElmTest.Runner.Console exposing (runDisplay)

import Test.Calculator as Calculator
import Test.Parser as Parser
import Test.Process as Process

tests : Test
tests = suite "TodoTDD Tests"
        [ Calculator.tests
        , Parser.tests
        , Process.tests
        ]

port requests : Signal Request
port requests = run responses (runDisplay tests)

port responses : Signal Response
