#!/bin/bash
docker build -t rjsteinert/cordova-apk-server:local .
docker kill cordova-apk-server
docker rm cordova-apk-server
docker run -d -p 80:80 \
  --name cordova-apk-server \
  --volume $(pwd)/apks:/cordova-apk-server/apks \
  --volume $(pwd)/zips:/cordova-apk-server/zips \
  rjsteinert/cordova-apk-server:local
docker logs -f cordova-apk-server
