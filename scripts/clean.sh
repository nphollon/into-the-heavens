#! /usr/bin/env bash

rm -rf temp
rm public_html/heavens.js

if [[ $1 == "--full" ]];
then
    rm -rf elm-stuff
else
    rm -rf elm-stuff/build-artifacts
fi;
