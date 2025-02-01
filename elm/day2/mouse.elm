module MousePosition exposing (..)

import Browser
import Browser.Events
import Html exposing (..)
import Json.Decode as JD


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { position = (Position 0 0) }, Cmd.none )



-- MODEL


type alias Position =
    { x : Int, y : Int }


type alias Model =
    { position : Position }



-- UPDATE


type Msg
    = MouseMoved Position


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( MouseMoved position, _ ) ->
            ( { model | position = position }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onMouseMove (JD.map MouseMoved positionDecoder)


positionDecoder : JD.Decoder Position
positionDecoder =
    JD.map2 Position
        (JD.field "pageX" JD.int)
        (JD.field "pageY" JD.int)



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (positionToString model.position) ]


positionToString : Position -> String
positionToString position =
    "(" ++ String.fromInt position.x ++ ", " ++ String.fromInt position.y ++ ")"
