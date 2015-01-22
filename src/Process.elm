module Process where

import Parser
import Calculator

type Update =
    Add String
  | NoOp

process : (String -> a) -> Update -> a
process result update =
    case update of
      Add value ->
        Parser.parse value
          |> Calculator.add
          |> toString
          |> result
      NoOp -> result ""

