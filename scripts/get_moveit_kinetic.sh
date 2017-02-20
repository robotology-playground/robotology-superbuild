#!/bin/bash

cd $ROBOTOLOGY_ROOT
mkdir -p external/moveit/src
cd external/moveit/src
wstool init .
wstool merge https://raw.githubusercontent.com/ros-planning/moveit/kinetic-devel/moveit.rosinstall
wstool update
cd ..
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y
catkin_make
catkin_make install
