#!/bin/bash
# configure
ARM_ABI=armv8
# ARM_ABI=armv7hf
PADDLE_LITE_DIR="$(pwd)/"
# build
cd $(pwd)/src

if [ "x$1" != "x" ]; then
    ARM_ABI=$1
fi

echo "ARM_ABI is ${ARM_ABI}"
echo "PADDLE_LITE_DIR is ${PADDLE_LITE_DIR}"
rm -rf build
mkdir build
make clean
cd build
cmake -DPADDLE_LITE_DIR=${PADDLE_LITE_DIR} -DARM_ABI=${ARM_ABI} ..
make

echo "make successful!"

# mkdir
#cd ../../
#if [ ! -d "./ppocr_demo" ]; then
#mkdir ppocr_demo
#fils

#cp ../libhttplib.so ./libhttplib.so
#cp ../libhttplib.so.0 ./libhttplib.so.0
#cp ../libhttplib.so.0.10.8 ./libhttplib.so.0.10.8
cp ../upload.jpg ./upload.jpg

#cp ${PADDLE_LITE_DIR}/libs/${ARM_ABI}/libpaddle_light_api_shared.so ./ppocr_demo

echo "copy successful!"
./postdemo
#fi
#cp ./src/build/ppocr_demo ./ppocr_demo
#echo "copy ppocr_demo successful!"
