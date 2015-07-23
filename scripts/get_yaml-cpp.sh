#!/bin/sh
ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/..)

echo "Installing yaml-cpp from sources..."

mkdir -p $ROBOTOLOGY_ROOT/tmp
cd $ROBOTOLOGY_ROOT/tmp
wget https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz
tar xzf yaml-cpp-0.5.1.tar.gz
mkdir $ROBOTOLOGY_ROOT/tmp/yaml-cpp-0.5.1/build
cd $ROBOTOLOGY_ROOT/tmp/yaml-cpp-0.5.1/build
cmake .. -DBUILD_SHARED_LIBS=ON; make -j$((`nproc` - 1)); make;
sudo make install;
cd $ROBOTOLOGY_ROOT;
sudo rm -rf $ROBOTOLOGY_ROOT/tmp
echo "...done!"

