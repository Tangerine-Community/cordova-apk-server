INPUT=$1
OUTPUT=$2
TMP="./.tmp-$(date +%s)"

set -x

mkdir $TMP
cp $INPUT $TMP/archive.zip
cd $TMP
unzip archive.zip
npm install
./node_modules/.bin/cordova platform add android 
./node_modules/.bin/cordova build android
sleep 3
mv ./platforms/android/build/outputs/apk/debug/android-debug.apk $OUTPUT 
#rm -r $TMP
