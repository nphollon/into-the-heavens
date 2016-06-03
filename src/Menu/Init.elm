module Menu.Init exposing (mainMenu, crash, victory)

import Random.Pcg exposing (Seed)
import Types exposing (..)


mainMenu : Seed -> Library -> ( Mode, Cmd Update )
mainMenu =
    menu LevelSelect


crash : Level -> Seed -> Library -> ( Mode, Cmd Update )
crash =
    Lost >> menu


victory : Level -> Seed -> Library -> ( Mode, Cmd Update )
victory =
    Won >> menu


menu : Room -> Seed -> Library -> ( Mode, Cmd Update )
menu room seed library =
    let
        model =
            MenuMode
                { seed = seed
                , library = library
                , room = room
                }
    in
        model ! []
