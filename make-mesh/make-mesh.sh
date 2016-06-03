#/usr/bin/env bash

temp_dir=${TMPDIR:-"/tmp"}
elm_out="$temp_dir/make-mesh-raw.js"
io_out="$temp_dir/make-mesh.js"
io_sh="elm-io.sh"
main_elm="Main.elm"
elm_make="node_modules/.bin/elm-make"

cd make-mesh
$elm_make $main_elm --output $elm_out --yes

if [ $? -ne 0 ]; then exit 1; fi;

bash $io_sh $elm_out $io_out
if [ $? -ne 0 ]; then exit 1; fi;

echo "Successfully generated $io_out"

node $io_out
