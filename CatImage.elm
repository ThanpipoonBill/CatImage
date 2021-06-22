
module CatImage exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Array exposing (Array)

type alias Model =
        {
            catarray : Array String
            ,count : Int
        }
initmodel : Model
initmodel =
        {
            catarray = Array.fromList["https://cdn2.thecatapi.com/images/9r8.jpg", "https://cdn2.thecatapi.com/images/4et.jpg", "https://cdn2.thecatapi.com/images/4t1.jpg", "https://cdn2.thecatapi.com/images/MTQ5NjUwNQ.jpg", "https://cdn2.thecatapi.com/images/tF_6-Beo_.jpg"] 
            , count = 0
        }


type Msg =
    Nextcat
    
update : Msg -> Model -> Model
update msg model =
    case msg of
        Nextcat ->
            {model| count = 
                if model.count +1 >= Array.length model.catarray then    
                    0
                else
                    model.count+1

             }
    


view : Model -> Html Msg
view model =
  div []
        [   
             div[] [img[src (Array.get model.count model.catarray |> Maybe.withDefault"no cat")][]]
            , button [onClick Nextcat][text"Next Cat"]
            
        ]
       


main =
    Browser.sandbox
        { init = initmodel
        , view = view
        , update = update
        }
 


