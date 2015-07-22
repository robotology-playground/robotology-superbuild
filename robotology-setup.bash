#!/bin/bash

ROBOTOLOGY_ROOT=$(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))
if [ -f $ROBOTOLOGY_ROOT/build/active_profile ]; then
    source $ROBOTOLOGY_ROOT/build/active_profile
else
    export ROBOTOLOGY_PROFILE=SIMULATION
fi

pathadd() {
    if [ -z ${!1} ]; then
        export $1=$2
    elif [ -d "$2" ] && [[ ! ${!1} =~ (^|:)$2(:|$) ]]; then
        export $1+=:$2
    fi
}

if [ -f /opt/ros/hydro/setup.bash ]; then
    source /opt/ros/hydro/setup.bash
fi


if [ -f /opt/ros/indigo/setup.bash ]; then
    source /opt/ros/indigo/setup.bash
fi

#gazebo setup
if [ -f /usr/share/gazebo/setup.sh ]; then
    source /usr/share/gazebo/setup.sh
fi

export PATH=$ROBOTOLOGY_ROOT/build/install/bin:$PATH
export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib:$LD_LIBRARY_PATH
export LTDL_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib/roboptim-core:$LTDL_LIBRARY_PATH
pathadd CMAKE_PREFIX_PATH $ROBOTOLOGY_ROOT/build/install
export ROS_PACKAGE_PATH=$ROBOTOLOGY_ROOT/build/install/share:$ROS_PACKAGE_PATH
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/stacks
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/IITComanRosPkg
pathadd CPATH $ROBOTOLOGY_ROOT/build/install/include
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/site-packages
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/dist-packages
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/external/OpenSoT/python/interfaces/yarp
pathadd PKG_CONFIG_PATH $ROBOTOLOGY_ROOT/build/install/lib/pkgconfig
pathadd GAZEBO_PLUGIN_PATH $ROBOTOLOGY_ROOT/build/install/lib
pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/IITComanRosPkg/coman_gazebo/database
pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/icub_gazebo
if [ -d $ROBOTOLOGY_ROOT/robots/iit-bigman-ros-pkg ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/iit-bigman-ros-pkg
	pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/iit-bigman-ros-pkg/bigman_gazebo/database
fi

export COMAN_ROOT=${ROBOTOLOGY_ROOT}/build/install

# TODO add a switch here to select correct robot
export YARP_ROBOT_NAME=coman
export YARP_COLORED_OUTPUT=1
export YARP_DATA_DIRS=${ROBOTOLOGY_ROOT}/build/install/share/yarp/


unset YARP_CLOCK
unalias gazebo > /dev/null 2>&1
unalias gzserver > /dev/null 2>&1
if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" == "SIMULATION" ]; then
    export YARP_CLOCK=/clock
    alias gazebo='gazebo -s libgazebo_yarp_clock.so'
    alias gzserver='gzserver -s libgazebo_yarp_clock.so'
fi


if [ -f ${ROBOTOLOGY_ROOT}/external/YARP/scripts/yarp_completion ]; then
    source ${ROBOTOLOGY_ROOT}/external/YARP/scripts/yarp_completion
fi
