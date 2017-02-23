#!/bin/sh

sudo apt-get update

# essential
sudo apt-get install git cmake cmake-curses-gui build-essential gitg git-gui meld vim mercurial

# ROS list and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Gazebo list and key
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update

if [ "`lsb_release -cs`" = 'trusty' ]; then
	sudo apt-get install ros-indigo-desktop-full
	sudo apt-get install ros-indigo-gazebo6-ros-pkgs
	
	#find a proper way to check the current cmake version
	#if [ "`cmake --version`"  != '3.5.1' ]; then
		sh ./get_cmake_3_5_1.sh
	#fi
fi
