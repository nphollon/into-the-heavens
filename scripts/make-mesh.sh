#!/usr/bin/env bash

temp_dir=${TMPDIR:-"/tmp"}
test_out="$temp_dir/test.js"
test_src="src/Test.elm"
main_out="../public_html/make-mesh.html"
main_src="src/Main.elm"

cd make-mesh

elm make $test_src --yes --output $test_out
if [ $? -ne 0 ]; then exit 1; fi;

node $test_out
if [ $? -ne 0 ]; then exit 1; fi;

elm make $main_src --yes --output $main_out
