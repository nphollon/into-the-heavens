#!/usr/bin/env bash

temp_dir=${TMPDIR:-"/tmp"}
elm_out="$temp_dir/test-raw.js"
io_out="$temp_dir/test.js"
io_sh="elm-stuff/packages/laszlopandy/elm-console/1.1.1/elm-io.sh"
main_elm="Test.elm"

cd test
elm make $main_elm --output $elm_out --yes

if [ $? -ne 0 ]; then exit 1; fi;

bash $io_sh $elm_out $io_out
if [ $? -ne 0 ]; then exit 1; fi;

echo "Successfully generated $io_out"

node $io_out
