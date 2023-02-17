#!/bin/bash

PORT=8081

cd build/web/

rm -rf ./client.apk

ln -s /areapp/client.apk ./client.apk

python3 -m http.server $PORT