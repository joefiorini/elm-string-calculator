module Parser where

import String
import Result
import List

-- Takes comma-seperated list of numbers and
-- breaks them into a list, using an
-- empty list to represent a blank string

parseDelim : String -> String -> List Int
parseDelim delim list =
  case list of
    "" -> []
    s ->
      List.filterMap mkNumber
        <| String.split delim s

parse : String -> List Int
parse = parseDelim ","

mkNumber : String -> Maybe Int
mkNumber s =
  case String.toInt s of
    Result.Ok n -> Just n
    Result.Err s -> Nothing
