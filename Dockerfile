FROM beevelop/android-nodejs:latest
RUN mkdir /input && mkdir /output
ADD ./package.json /cordova-apk-server/package.json
RUN cd /cordova-apk-server && npm install
ADD ./ /cordova-apk-server/
WORKDIR /cordova-apk-server
VOLUME /cordova-apk-server/apks
VOLUME /cordova-apk-server/zips
ENTRYPOINT ./node_modules/.bin/nodemon -L index.js
