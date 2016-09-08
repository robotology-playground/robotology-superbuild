#!/bin/bash


if [ -d $ROBOTOLOGY_ROOT/catkin_pkg/vigir_pluginlib ]
then
	echo "vigir_pluginlib already installed. Please check your $ROBOTOLOGY_ROOT/catkin_pkg/ folder\n";
else
	mkdir -p $ROBOTOLOGY_ROOT/catkin_pkg/vigir_pluginlib/src
	cd $ROBOTOLOGY_ROOT/catkin_pkg/vigir_pluginlib/src
	git clone https://github.com/team-vigir/vigir_pluginlib.git 
	git clone https://github.com/team-vigir/vigir_generic_params.git 
	catkin_init_workspace
	cd ..
	catkin_make
fi
