#!/bin/bash

echo "Installing yaml-cpp from sources..."
#check if ROBOTOLOGY_ROOT is defined
if [ -n "$ROBOTOLOGY_ROOT" ]
then

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

else
    echo "Please source robotology-setup.bash before running this script."
    exit
fi

