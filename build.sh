#!/bin/bash

export JEKYLL_ENV=production
bundle exec jekyll build

# Delete dummy feed
DUMMY_FEED=_site/site-feed.xml
if [ -f "${DUMMY_FEED}" ]; then
  rm ${DUMMY_FEED}
fi

SITE_REPO=../upskillzone.github.io
if [ -d "${SITE_REPO}" ]; then
    rm ${SITE_REPO}/* -rf
    cp _site/* "${SITE_REPO}" -rf
fi
