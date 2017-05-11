#!/bin/sh

sudo apt-get update

# essential
sudo apt-get install git cmake cmake-curses-gui build-essential gitg git-gui meld vim terminator mercurial libmatio-dev doxygen

# ROS list and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Gazebo list and key
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update

if [ "`lsb_release -cs`" = 'trusty' ]; then
	sudo apt-get install ros-indigo-desktop-full
	sudo apt-get install ros-indigo-kdl-parser ros-indigo-eigen-conversions
	sudo apt-get install ros-indigo-gazebo6-ros-pkgs
	
	#find a proper way to check the current cmake version
	#if [ "`cmake --version`"  != '3.5.1' ]; then
	sh ./get_cmake_3_5_1.sh
	cp FindEigen3.cmake /usr/local/share/cmake-3.5/Modules # fix Eigen3 not found on external project
        #fi
fi

if [ "`lsb_release -cs`" = 'xenial' ]; then
        sudo apt-get install ros-kinetic-desktop-full
	sudo apt-get install ros-kinetic-eigen-conversions ros-kinetic-kdl-parser ros-kinetic-effort-controllers ros-kinetic-controller-manager ros-kinetic-transmission-interface
        sudo apt-get install ros-kinetic-gazebo-ros-pkgs

fi

# dependency from iit-bigman-ros-package
sudo apt-get install python-pip
sudo pip install BeautifulSoup4 lxml 


# ROS config
sudo rosdep init
rosdep update
