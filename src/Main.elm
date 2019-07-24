module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Element exposing (..)
import Html exposing (Html, node, option, select)
import Html.Attributes exposing (value)
import Html.Events exposing (on)
import Json.Decode as JD
import Json.Encode as JE


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init, view = view, update = update }


type alias Model =
    {}


type Msg
    = NoOp


init : Model
init =
    {}


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html Msg
view model =
    layout [ padding 32 ] <|
        column [ spacing 24 ]
            [ text "Hello?"
            , el [] <| html <| node "hello-world" [] []
            , el [] <|
                html <|
                    select []
                        [ option [ value "a" ] [ Html.text "a" ]
                        , option [ value "b" ] [ Html.text "b" ]
                        , option [ value "c" ] [ Html.text "c" ]
                        ]
            ]
