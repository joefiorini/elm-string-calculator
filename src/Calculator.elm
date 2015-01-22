module Calculator where

import List

add : List Int -> Int
add nums =
  case nums of
    [] -> 0
    otherwise -> List.foldl (+) 0 nums
