#!/bin/bash

echo "This script will create an orocos_ws in your robotology_superbuild folder."

cd $ROBOTOLOGY_ROOT
mkdir orocos_ws
cd orocos_ws

catkin_init_workspace

export GIT_SSL_NO_VERIFY=1
git clone --recursive -b toolchain-2.7 http://git.gitorious.org/orocos-toolchain/orocos_toolchain.git src

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROBOTOLOGY_ROOT/orocos_ws/src

sudo apt-get install ruby ruby-dev
sudo apt-get install omniorb-idl omniorb omniorb-nameserver
sudo gem install rake hoe

rosdep install orocos_toolchain

source src/env.sh
catkin_make_isolated --install -DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB

