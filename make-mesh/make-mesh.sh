#/usr/bin/env bash

elm_out="make-mesh.html"
file_writer="http-file-writer.js"

cd make-mesh
elm make Main.elm --yes --output $elm_out

if [ $? -ne 0 ]; then exit 1; fi;

node $file_writer
