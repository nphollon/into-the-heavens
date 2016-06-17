#! /usr/bin/env bash

temp_dir=${TMPDIR:-"/tmp"}
elm_out="$temp_dir/elm.js"
min_out="$temp_dir/elm.js.min"
final_out="public_html/heavens.js"
main_elm="src/Main.elm"
elm_make="elm-make"

function compile {
    test/run.sh;
    if [ $? -ne 0 ]; then exit 1; fi;

    echo; echo;
    echo "Hostname: $1";

    $elm_make $main_elm --output $elm_out --yes --warn
    if [ $? -ne 0 ]; then exit 1; fi;

    uglifyjs $elm_out -m -c warnings=false -o $min_out
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
    scp -r public_html intotheh@intotheheavens.net:.
elif [ $1 == "test" ];
then
    compile "http:\/\/localhost:8080\/~vagrant";
else
    echo "Invalid environment: $1"
    exit 1;
fi;

