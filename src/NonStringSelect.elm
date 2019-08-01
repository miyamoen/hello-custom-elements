module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Element exposing (..)
import Html exposing (Html, node, option, select)
import Html.Attributes exposing (attribute, value)
import Html.Events exposing (on)
import Json.Decode as JD
import Json.Encode as JE
import Process exposing (sleep)
import Task


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }


type alias Model =
    { selectedGoat : Maybe Goat
    , options : List Goat
    }


type Msg
    = NoOp
    | Select Goat
    | Unselect
    | SetOptions (List Goat)


init : () -> ( Model, Cmd Msg )
init _ =
    ( { selectedGoat = Nothing
      , options = [ Shiba ]
      }
    , sleep 1000 |> Task.perform (always <| SetOptions [ Saanen, Shiba, Pygmy, Angora ])
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


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
            , el [] <|
                html <|
                    node "non-string-select"
                        [ on "unselect" <| JD.succeed Unselect
                        , List.map goatToString model.options
                            |> String.join "/"
                            |> changeKey
                        ]
                    <|
                        List.map
                            (\goat ->
                                option [ onSelect <| Select goat ] [ Html.text <| goatToString goat ]
                            )
                            model.options
            ]
