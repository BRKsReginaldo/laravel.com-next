#!/bin/bash

# Pull docs repos for each docs version or, if already pulled, pull the latest commits

DOCS_VERSIONS=(
  master
  6.0
  5.8
)

for v in "${DOCS_VERSIONS[@]}"; do
    if [ -d "resources/docs/$v" ]; then
        echo "Pulling latest for $v..."
        (cd resources/docs/$v && git pull)
    else
        echo "Cloning $v..."
        git clone --single-branch --branch "$v" git@github.com:BRKsReginaldo/laravel-docs.git "resources/docs/$v"
    fi;
done
