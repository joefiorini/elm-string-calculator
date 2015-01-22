import Html (Html, main', section, input, label, text, select, option, p)
import Html.Attributes (type')
import Html.Events (on, targetValue)
import Text (plainText)
import Signal
import Signal ((<~))
import Process

import Doubler

main =
  container <~ state

state =
  Signal.subscribe updates |>
    Signal.foldp Process.process Process.default

container state =
  main'
    []
    [ delimiterInput
    , numberInput
    , numberOutput state.result
    ]

updates : Signal.Channel Process.Update
updates =
  Signal.channel Process.NoOp

delimiterInput =
  section
    []
    [ label
        []
        [text "Choose Delimiter"]
    , select
        [on "change" targetValue
          (\v -> Signal.send updates (Process.ChangeDelimiter v))
        ]
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
