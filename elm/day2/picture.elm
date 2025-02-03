module MousePosition exposing (..)

import Browser
import Browser.Events
import Html exposing (..)
import Json.Decode as JD
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { position = Position 0 0
      , mouseDown = False
      }
    , Cmd.none
    )



-- MODEL


type alias Position =
    { x : Float, y : Float }


type alias Model =
    { position : Position
    , mouseDown : Bool
    }



-- UPDATE


type Msg
    = MouseMoved Position
    | MouseDown
    | MouseUp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( MouseMoved position, _ ) ->
            ( { model | position = position }, Cmd.none )

        ( MouseDown, _ ) ->
            ( { model | mouseDown = True }, Cmd.none )

        ( MouseUp, _ ) ->
            ( { model | mouseDown = False }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Browser.Events.onMouseMove (JD.map MouseMoved positionDecoder)
        , Browser.Events.onMouseDown (JD.succeed MouseDown)
        , Browser.Events.onMouseUp (JD.succeed MouseUp)
        ]


positionDecoder : JD.Decoder Position
positionDecoder =
    JD.map2 Position
        (JD.map2 (/) (JD.field "pageX" JD.float) (JD.at [ "currentTarget", "defaultView", "innerWidth" ] JD.float))
        (JD.map2 (/) (JD.field "pageY" JD.float) (JD.at [ "currentTarget", "defaultView", "innerHeight" ] JD.float))



-- VIEW


view : Model -> Html Msg
view model =
    svg
        [ width "100%"
        , height "100%"
        , viewBox "0 0 100 100"
        ]
        [ circle
            [ cx (String.fromFloat (model.position.x * 100))
            , cy (String.fromFloat (model.position.y * 100))
            , r "1"
            ]
            []
        ]
