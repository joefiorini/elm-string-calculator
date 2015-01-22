import Html (Html, main', section, input, label, text, select, option, p)
import Html.Attributes (type')
import Html.Events (on, targetValue)
import Text (plainText)
import Signal
import Process

import Doubler

delimiterInput =
  section
    []
    [ label
        []
        [text "Choose Delimiter"]
    , select
        []
        [ option [] [text ","]
        , option [] [text "|"]
        , option [] [text "+"]
        , option [] [text "/"]
        ]
    ]

numberInput =
  section
    []
    [ label
        []
        [ text "Enter some numbers seperated by chosen delimiter:"
        ]
    , input
        [ type' "text"
        , on "input" targetValue
          (\v -> Signal.send updates (Process.Add v))
        ]
        []
    ]

numberOutput result =
  section
    []
    [ p
      []
      [ text <| "Your result is: " ++ result]
    ]

container value =
  main'
    []
    [ delimiterInput
    , numberInput
    , numberOutput value
    ]

updates : Signal.Channel Process.Update
updates =
  Signal.channel Process.NoOp

main =
  Signal.map
    (Process.process container)
    <| Signal.subscribe updates
