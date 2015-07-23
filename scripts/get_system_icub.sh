#!/bin/sh
# remove system icub and YARP
echo "Removing system icub and yarp..."
sudo apt-get remove --purge icub yarp

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/..)

echo "Installing icub from sources to /usr/local..."

mkdir -p $ROBOTOLOGY_ROOT/tmp
cd $ROBOTOLOGY_ROOT/tmp
if [ ! -d icub-main ]
then
    git clone https://github.com/robotology/icub-main.git
fi
cd icub-main
git fetch --all
git checkout 4a76f952d5
mkdir -p ./build && cd ./build
PREV_YARP_ROBOT_NAME=$YARP_ROBOT_NAME
export YARP_ROBOT_NAME=
cmake .. && make -j$((`nproc` - 1)) && make
sudo make install
export YARP_ROBOT_NAME=$PREV_YARP_ROBOT_NAME
cd $ROBOTOLOGY_ROOT;
sudo rm -rf $ROBOTOLOGY_ROOT/tmp

# rm robotology-superbuild main CMakeCache
rm -f $ROBOTOLOGY_ROOT/build/CMakeCache.txt
echo "...done!"


