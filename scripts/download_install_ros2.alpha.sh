#!/bin/bash

#Create a WS for ROS2 and download code
if [ ! -f ${ROBOTOLOGY_ROOT}/external/ros2_ws/src/ament/ament_tools/scripts/ament.py ]
then
    	mkdir -p ${ROBOTOLOGY_ROOT}/external/ros2_ws/src
	cd ${ROBOTOLOGY_ROOT}/external/ros2_ws
	wget https://raw.githubusercontent.com/ros2/ros2/release-alpha1/ros2.repos
	vcs import ${ROBOTOLOGY_ROOT}/external/ros2_ws/src < ros2.repos
fi

#This will use a bootstrap code inside ros2_ws/src that will built ros2 using ament
cd ${ROBOTOLOGY_ROOT}/external/ros2_ws/
src/ament/ament_tools/scripts/ament.py build --build-tests --symlink-install
