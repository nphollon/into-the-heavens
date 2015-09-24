#/usr/bin/env bash

elm_out="temp/make-mesh-raw.js"
io_out="temp/make-mesh.js"
io_sh="elm-stuff/packages/maxsnew/IO/1.0.1/elm-io.sh"
final_out_dir="public_html"
main_elm="src/Generate/Main.elm"

elm make $main_elm --output $elm_out --yes

if [ $? -ne 0 ]; then exit 1; fi;

sh $io_sh $elm_out $io_out
if [ $? -ne 0 ]; then exit 1; fi;

echo "Successfully generated $io_out"

node $io_out $final_out_dir
