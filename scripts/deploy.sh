#! /usr/bin/env bash

elm_out="temp/elm.js"
min_out="temp/elm.js.min"
final_out="public_html/heavens.js"
main_elm="src/Main.elm"

function compile {
    echo "Hostname: $1";

    elm make $main_elm --output $elm_out --yes --warn
    if [ $? -ne 0 ]; then exit 1; fi;

    cp $elm_out $min_out
    if [ $? -ne 0 ]; then exit 1; fi;
    echo "Successfully generated $min_out"

    sed "s/\$DOMAIN/$1/g" $min_out > $final_out;
    if [ $? -ne 0 ]; then exit 1; fi;
    echo "Successfully generated $final_out"
}

if [ $# -lt 1 ];
then
    echo "Usage: $0 [test|prod]";
elif [ $1 == "prod" ];
then
    compile "https:\/\/intotheheavens\.net";
    scripts/make-mesh.sh
    scp -r public_html intotheh@intotheheavens.net:.
elif [ $1 == "test" ];
then
    compile "http:\/\/localhost:8080\/~vagrant";
else
    echo "Invalid environment: $1"
    exit 1;
fi;

