#!/bin/bash

export JEKYLL_ENV=production
bundle exec jekyll build

SITE_REPO=../upskillzone.github.io
if [ -d "$SITE_REPO" ]; then
    cp _site/* "$SITE_REPO" -rf
fi
