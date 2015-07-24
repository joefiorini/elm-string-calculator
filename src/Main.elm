import Html exposing (Html, main', section, input, label, text, select, option, p)
import Html.Attributes exposing (type')
import Html.Events exposing (on, targetValue)
import Signal
import Signal exposing ((<~))
import Process

main =
  container <~ state

state =
  updates.signal |>
    Signal.foldp Process.process Process.default

container state =
  main'
    []
    [ delimiterInput
    , numberInput
    , numberOutput state.result
    ]

updates : Signal.Mailbox Process.Update
updates =
  Signal.mailbox Process.NoOp

delimiterInput =
  section
    []
    [ label
        []
        [text "Choose Delimiter"]
    , select
        [on "change" targetValue
          (\v -> Signal.message updates.address (Process.ChangeDelimiter v))
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
          (\v -> Signal.message updates.address (Process.Add v))
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
