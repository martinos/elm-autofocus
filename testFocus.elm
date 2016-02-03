module TestFocus (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple as StartApp


focusAttr focus =
  if focus then
    [ attribute "data-autofocus" "" ]
  else
    []


model =
  { input1 = False, input2 = True }



-- main = view 1 1


main =
  StartApp.start
    { model = model
    , view = view
    , update = update
    }


view address model =
  div
    []
    [ input [ autofocus model.input1 ] []
    , input [ autofocus model.input2 ] []
    , button [ onClick address FocusOnOne ] [ text "Focus on 1" ]
    , button [ onClick address FocusOnTwo ] [ text "Focus on 2" ]
    ]


type Action
  = NoOp
  | FocusOnOne
  | FocusOnTwo


update action model =
  case action of
    NoOp ->
      model

    FocusOnOne ->
      { model | input1 = True, input2 = False } |> Debug.log "coucouu"

    FocusOnTwo ->
      { model | input1 = False, input2 = True }

