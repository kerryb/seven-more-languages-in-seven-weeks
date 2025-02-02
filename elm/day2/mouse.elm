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
    ( { position = Position 0 0
      , mouseDown = False
      , clickedAt = []
      }
    , Cmd.none
    )



-- MODEL


type alias Position =
    { x : Int, y : Int }


type alias Model =
    { position : Position
    , mouseDown : Bool
    , clickedAt : List Position
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
            ( { model
                | mouseDown = False
                , clickedAt = model.position :: model.clickedAt
              }
            , Cmd.none
            )



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
        (JD.field "pageX" JD.int)
        (JD.field "pageY" JD.int)



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (positionToString model.position)
        , text " "
        , text (mouseDownToString model.mouseDown)
        , ul [] (clickedAtToListItems model.clickedAt)
        ]


positionToString : Position -> String
positionToString position =
    "(" ++ String.fromInt position.x ++ ", " ++ String.fromInt position.y ++ ")"


mouseDownToString : Bool -> String
mouseDownToString mouseDown =
    if mouseDown then
        "down"

    else
        "up"


clickedAtToListItems : List Position -> List (Html msg)
clickedAtToListItems clickedAtList =
    List.map
        (\clickedAt -> li [] [ text ("Clicked at " ++ positionToString clickedAt) ])
        clickedAtList
