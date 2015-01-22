import Html (main', section, input, label, text, select, option, p)
import Html.Attributes (type')
import Text (plainText)

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
        [ type' "text" ]
        []
    ]

numberOutput result =
  section
    []
    [ p
      []
      [ text <| "Your result is: " ++ result]
    ]

main =
  main'
    []
    [ delimiterInput
    , numberInput
    , numberOutput ""
    ]
