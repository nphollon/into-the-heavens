#! /usr/bin/env bash

temp_dir=${TMPDIR:-"/tmp"}
elm_out="$temp_dir/elm.js"
final_out="public_html/heavens.js"
main_elm="src/Main.elm"

scripts/test.sh;
if [ $? -ne 0 ]; then exit 1; fi;

scripts/make-mesh.sh;
if [ $? -ne 0 ]; then exit 1; fi;

echo;

elm make $main_elm --output $elm_out --yes --warn
if [ $? -ne 0 ]; then exit 1; fi;

uglifyjs $elm_out -m -c warnings=false -o $final_out
if [ $? -ne 0 ]; then exit 1; fi;

echo "Successfully minified to $final_out"

if [ $1 == "prod" ];
then
    scp -r public_html intotheh@intotheheavens.net:.
fi;
