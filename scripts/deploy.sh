#! /usr/bin/env bash

temp_js="temp/elm.js"
output="public_html/heavens.js"
compiler_jar="scripts/compiler.jar"
main_elm="src/Main.elm"

elm make $main_elm --output $temp_js
java -jar $compiler_jar --js $temp_js --js_output_file $output --language_in=ECMASCRIPT5
