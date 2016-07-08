#! /usr/bin/env bash

rm -rf temp
rm public_html/heavens.js

if [[ $1 == "--full" ]];
then
    rm -rf elm-stuff
    rm -rf test/elm-stuff
    rm -rf make-mesh/elm-stuff
else
    rm -rf elm-stuff/build-artifacts
    rm -rf test/elm-stuff/build-artifacts
    rm -rf make-mesh/elm-stuff/build-artifacts
fi;
