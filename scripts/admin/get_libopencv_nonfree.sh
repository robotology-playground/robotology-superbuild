#!/bin/bash

echo "Installing opencv nonfree lib from sources..."
cd /tmp
sudo rm -rf opencv
#clone the repo to 2.4.8.x-prep branch
git clone -b 2.4 --depth 1 https://github.com/Itseez/opencv.git
mkdir -p /tmp/opencv/build
cd /tmp/opencv/build
cmake ..; make -j$((`nproc` - 1)) opencv_nonfree;
#custom install: copy nonfree lib in libs folder 
#sudo chmod 777 lib/libopencv_nonfree.so*
OPENCV_CORE_COMPLETE_PATH=`dpkg -L libopencv-core2.4 | grep libopencv_core.so.2.4.8`
OPENCV_LIBS_FOLDER=`dirname $OPENCV_CORE_COMPLETE_PATH`
sudo cp -d lib/libopencv_nonfree* $OPENCV_LIBS_FOLDER
#custom install: copy nonfree include in opencv2 include folder
sudo cp -r ../modules/nonfree/include/opencv2/nonfree/ /usr/include/opencv2/
#add nonfree lib component in /usr/share/OpenCV/OpenCVConfig.cmake 
sudo sed -i -e 's/SET(OpenCV_LIB_COMPONENTS /SET(OpenCV_LIB_COMPONENTS opencv_nonfree;/' /usr/share/OpenCV/OpenCVConfig.cmake
echo "...done!"

