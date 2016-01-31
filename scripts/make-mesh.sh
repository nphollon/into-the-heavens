#/usr/bin/env bash

elm_out="temp/make-mesh-raw.js"
io_out="temp/make-mesh.js"
io_sh="elm-stuff/packages/laszlopandy/elm-console/1.1.0/elm-io.sh"
main_elm="src/Generate/Main.elm"

elm make $main_elm --output $elm_out --yes

if [ $? -ne 0 ]; then exit 1; fi;

bash $io_sh $elm_out $io_out
if [ $? -ne 0 ]; then exit 1; fi;

echo "Successfully generated $io_out"

node $io_out
