#/usr/bin/env bash

cd make-mesh
elm make Main.elm --yes --output "make-mesh.html"

if [ $? -ne 0 ]; then exit 1; fi;

node "file-server.js"
