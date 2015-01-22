module Process where

import Parser
import Calculator

type Update =
    Add String
  | ChangeDelimiter String
  | NoOp

type alias State =
  { delimiter : String
  , result : String
  }

default =
  { delimiter = ","
  , result = ""
  }

process : Update -> State -> State
process update state =
    case update of
      Add value ->
        { state | result <-
            Parser.parseDelim state.delimiter value
              |> Calculator.add
              |> toString }
      ChangeDelimiter delimiter ->
        { state | delimiter <- delimiter }
      NoOp -> state

