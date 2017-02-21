#!/bin/bash

echo "Installig pcl 1.7.1 from sources..."
#check if ROBOTOLOGY_ROOT is defined
if [ -n "$ROBOTOLOGY_ROOT" ]
then

    mkdir -p $ROBOTOLOGY_ROOT/external/
    cd $ROBOTOLOGY_ROOT/external/
    #clone the pcl repo
    git clone https://github.com/PointCloudLibrary/pcl.git -b pcl-1.8.0 --depth 1 PCL

    mkdir -p $ROBOTOLOGY_ROOT/external/PCL/build
    cd $ROBOTOLOGY_ROOT/external/PCL/build
    rm CMakeCache.txt
    #build the release and install in /usr
    cmake -DBUILD_2d:BOOL=OFF -DBUILD_CUDA:BOOL=OFF -DBUILD_GPU:BOOL=OFF -DBUILD_apps:BOOL=OFF -DBUILD_common:BOOL=ON -DBUILD_examples:BOOL=OFF -DBUILD_features:BOOL=ON -DBUILD_filters:BOOL=ON -DBUILD_geometry:BOOL=ON -DBUILD_global_tests:BOOL=OFF -DBUILD_io:BOOL=ON -DBUILD_kdtree:BOOL=ON -DBUILD_keypoints:BOOL=OFF -DBUILD_ml:BOOL=OFF -DBUILD_octree:BOOL=ON -DBUILD_outofcore:BOOL=OFF -DBUILD_people:BOOL=OFF -DBUILD_recognition:BOOL=OFF -DBUILD_registration:BOOL=ON -DBUILD_sample_consensus:BOOL=ON -DBUILD_search:BOOL=ON -DBUILD_segmentation:BOOL=ON -DBUILD_simulation:BOOL=OFF -DBUILD_stereo:BOOL=OFF -DBUILD_surface:BOOL=ON -DBUILD_tools:BOOL=OFF -DBUILD_tracking:BOOL=OFF -DBUILD_visualization:BOOL=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    #avoid -j option: laptop could go out of virtual memory
    make -j`nproc`;

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


