#!/bin/bash

set -e

if [ -z ${BESTBUY_API_KEY} ]; then
  echo "Required environment variable BESTBUY_API_KEY not set."
  exit 1
fi

if [ -z ${BESTBUY_ARCHIVE} ]; then
  echo "Required environment variable BESTBUY_ARCHIVE not set."
  exit 1
fi

cd /tmp

curl "http://api.bestbuy.com/v1/$BESTBUY_ARCHIVE.json.zip?apiKey=$BESTBUY_API_KEY" > archive.zip

unzip archive.zip

cd archive

for f in *.json; do mongoimport --jsonArray --db bestbuy --collection $BESTBUY_ARCHIVE $f; done
