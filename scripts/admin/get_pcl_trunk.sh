#!/bin/bash

echo "Installig pcl 1.7.1 from sources..."
#check if ROBOTOLOGY_ROOT is defined
if [ -n "$ROBOTOLOGY_ROOT" ]
then

    mkdir -p $ROBOTOLOGY_ROOT/external/
    cd $ROBOTOLOGY_ROOT/external/
    #clone the pcl repo
    git clone https://github.com/PointCloudLibrary/pcl.git PCL

    mkdir -p $ROBOTOLOGY_ROOT/external/PCL/build
    cd $ROBOTOLOGY_ROOT/external/PCL/build
    rm CMakeCache.txt
    #build the release and install in /usr
    cmake -DBUILD_2d:BOOL=ON -DBUILD_CUDA:BOOL=ON -DBUILD_GPU:BOOL=ON -DBUILD_apps:BOOL=ON -DBUILD_common:BOOL=ON -DBUILD_examples:BOOL=ON -DBUILD_features:BOOL=ON -DBUILD_filters:BOOL=ON -DBUILD_geometry:BOOL=ON -DBUILD_global_tests:BOOL=ON -DBUILD_io:BOOL=ON -DBUILD_kdtree:BOOL=ON -DBUILD_keypoints:BOOL=ON -DBUILD_ml:BOOL=ON -DBUILD_octree:BOOL=ON -DBUILD_outofcore:BOOL=ON -DBUILD_people:BOOL=ON -DBUILD_recognition:BOOL=ON -DBUILD_registration:BOOL=ON -DBUILD_sample_consensus:BOOL=ON -DBUILD_search:BOOL=ON -DBUILD_segmentation:BOOL=ON -DBUILD_simulation:BOOL=ON -DBUILD_stereo:BOOL=ON -DBUILD_surface:BOOL=ON -DBUILD_tools:BOOL=ON -DBUILD_tracking:BOOL=ON -DBUILD_visualization:BOOL=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    #avoid -j option: laptop could go out of virtual memory
    make -j 6;

    #install
    sudo make install;
    cd $ROBOTOLOGY_ROOT;

    echo "...done!"

    sudo apt-mark hold libpcl-*
    echo "Marked libpcl-* for holding (not updating anymore)"

else
    echo "Please source robotology-setup.bash before running this script."
    exit
fi


