#!/bin/bash

docker build -t rjsteinert/cordova-apk-server:local .
docker kill cordova-apk-server
docker rm cordova-apk-server
docker run -it \
  -p 80:80 \
  --name cordova-apk-server \
  --volume $(pwd)/apks:/cordova-apk-server/apks \
  --volume $(pwd)/zips:/cordova-apk-server/zips \
  --volume $(pwd)/index.js:/cordova-apk-server/index.js \
  --volume $(pwd)/scripts:/cordova-apk-server/scripts \
  rjsteinert/cordova-apk-server:local
