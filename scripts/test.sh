#!/usr/bin/env bash

temp_dir=${TMPDIR:-"/tmp"}
elm_out="$temp_dir/test.js"
main_elm="Test.elm"
elm_make="elm-make"

cd test
$elm_make --yes --warn $main_elm --output $elm_out

if [ $? -ne 0 ]; then exit 1; fi;

node $elm_out
