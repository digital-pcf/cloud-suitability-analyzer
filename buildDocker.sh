#!/bin/bash
echo "~~~> Mounting docker image to build web ui"

echo "---> Ruquested OS builds..: $1"
echo "---> Version..............: $2"
docker run -it -e OS=$1 -e VERSION=$2 \
   -v ${PWD}:/cloud-suitability-analyzer \
   neur0manc3r/node-go-cross-build \
   ./buildWebUI.sh

echo "~~~> Mounting docker image to build go executable and bind in web"   
docker run -it -e OS=$1 -e VERSION=$2 \
   -v ${PWD}/:/cloud-suitability-analyzer \
   neur0manc3r/node-go-cross-build \
   ./build-CSA-Bind-UI.sh