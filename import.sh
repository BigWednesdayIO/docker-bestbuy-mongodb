#!/bin/bash

set -e

if [ -z ${BESTBUY_API_KEY} ]; then
  echo "Required environment variable BESTBUY_API_KEY not set."
  exit 1
fi

mkdir -p /tmp/bestbuydata
cd /tmp/bestbuydata

curl -L "http://api.bestbuy.com/v1/subsets/productsActive.json.zip?apiKey=$BESTBUY_API_KEY" > archive.zip

unzip archive.zip

for f in *.json; do mongoimport --jsonArray --db bestbuy --collection products $f; done
