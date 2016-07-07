#/usr/bin/env bash

cd make-mesh
elm make src/Main.elm --yes --output "../public_html/make-mesh.html"
