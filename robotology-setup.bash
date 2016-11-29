#!/bin/bash

ROBOTOLOGY_ROOT=$(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))

export ROBOTOLOGY_ROOT

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

#orocos
if [ -f ${ROBOTOLOGY_ROOT}/orocos_ws/install_isolated/setup.bash ]; then
       source ${ROBOTOLOGY_ROOT}/orocos_ws/install_isolated/setup.bash
       if [ -f ${ROBOTOLOGY_ROOT}/orocos_ws/src/env.sh ]; then
              source ${ROBOTOLOGY_ROOT}/orocos_ws/src/env.sh
       fi
       export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/orocos_ws/install_isolated/lib:$LD_LIBRARY_PATH
       export LIBRARY_PATH=$ROBOTOLOGY_ROOT/orocos_ws/install_isolated/lib:$LIBRARY_PATH
       pathadd RTT_COMPONENT_PATH /opt/ros/indigo/lib/orocos/gnulinux/ocl  
       pathadd RTT_COMPONENT_PATH /opt/ros/indigo/lib/orocos/gnulinux/plugins  
       pathadd RTT_COMPONENT_PATH /opt/ros/indigo/lib/orocos/gnulinux/rtt_ros  
       pathadd RTT_COMPONENT_PATH /opt/ros/indigo/lib/orocos/gnulinux/types

       pathadd RTT_COMPONENT_PATH /opt/ros/indigo/lib/orocos/gnulinux/rtt_sensor_msgs
       pathadd RTT_COMPONENT_PATH /opt/ros/indigo/lib/orocos/gnulinux/rtt_std_msgs

       pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos

       if [ -f ${ROBOTOLOGY_ROOT}/external/rtt-gazebo-lwr4plus-sim/CMakeLists.txt ]; then
              pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/external/rtt-gazebo-lwr4plus-sim/orocos
       fi

       if [ -f ${ROBOTOLOGY_ROOT}/robots/cogimon-gazebo-models/database.config ]; then
              pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/cogimon-gazebo-models
       fi

       if [ -f ${ROBOTOLOGY_ROOT}/external/rtt-gazebo-clock-plugin/CMakeLists.txt ]; then
              pathadd GAZEBO_PLUGIN_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/rtt_gazebo_system
       fi           
       
       if [ -f ${ROBOTOLOGY_ROOT}/robots/rtt_coman/CMakeLists.txt ]; then
              pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/rtt_coman
       fi 

       if [ -f ${ROBOTOLOGY_ROOT}/external/ros_orocos_joints_gui/CMakeLists.txt ]; then
              pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/ros_orocos_joints_gui
       fi
fi

#gazebo setup
if [ -f /usr/share/gazebo/setup.sh ]; then
    source /usr/share/gazebo/setup.sh
fi

if [ -f ${ROBOTOLOGY_ROOT}/external/ros2_ws/install/local_setup.sh ]; then
    source ${ROBOTOLOGY_ROOT}/external/ros2_ws/install/local_setup.*
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

if [ -d $ROBOTOLOGY_ROOT/robots/openth/ynl-hydra-ros-pkg ]; then
	pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/openth/ynl-hydra-ros-pkg
	pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/openth/ynl-hydra-ros-pkg/hydra_gazebo/database
fi

if [ -d $ROBOTOLOGY_ROOT/robots/iit-cogimon-ros-pkg ]; then
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/iit-cogimon-ros-pkg
	pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/iit-cogimon-ros-pkg/cogimon_gazebo/database
fi

if [ -d $ROBOTOLOGY_ROOT/external/yarp_ros_joint_state_publisher ]; then
	pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/yarp_ros_joint_state_publisher
fi

if [ -d $ROBOTOLOGY_ROOT/external/robot_state_publisher_ext ]; then
	pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/robot_state_publisher_ext
fi

if [ -d ${ROBOTOLOGY_ROOT}/external/ros_orocos_joints_gui ]; then
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/ros_orocos_joints_gui
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/ros_orocos_joints_gui/python
fi

# vigir stuffs
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_basics ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_basics
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_core ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_core
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_msgs ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_msgs
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_generic_params ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_generic_params
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_pluginlib ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_pluginlib
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_terrain_classifier ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_terrain_classifier
fi


export COMAN_ROOT=${ROBOTOLOGY_ROOT}/build/install

# TODO add a switch here to select correct robot
export YARP_ROBOT_NAME=bigman
export YARP_COLORED_OUTPUT=1
export YARP_DATA_DIRS=${ROBOTOLOGY_ROOT}/build/install/share/yarp/


unset YARP_CLOCK
unalias gazebo > /dev/null 2>&1
unalias gzserver > /dev/null 2>&1
if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" == "SIMULATION" ]; then
    export YARP_CLOCK=/clock

    # check for optirun
    HAS_OPTIRUN=true;
    type optirun >/dev/null 2>&1 || { HAS_OPTIRUN=false; }
    if [ $HAS_OPTIRUN == true ]; then
        alias gazebo='optirun gazebo -s libgazebo_yarp_clock.so'
    else
        alias gazebo='gazebo -s libgazebo_yarp_clock.so'
        alias gzserver='gzserver -s libgazebo_yarp_clock.so'
    fi

    alias gazeboros='export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROBOTOLOGY_ROOT/build/install/lib/drcsim_gazebo_ros_plugins/plugins; gazebo --verbose -s libgazebo_ros_api_plugin.so'

fi

export YARP_WORKSPACE=${ROBOTOLOGY_ROOT}/robots

if [ -f ${ROBOTOLOGY_ROOT}/external/YARP/scripts/yarp_completion ]; then
    source ${ROBOTOLOGY_ROOT}/external/YARP/scripts/yarp_completion
fi

# Some aliases for superbuild/scripts
alias superbuild=". ${ROBOTOLOGY_ROOT}/scripts/superbuild.sh"
source ${ROBOTOLOGY_ROOT}/scripts/superbuild.profile

# add robotology folder for robot models
if [ -d $ROBOTOLOGY_ROOT/build/install/share/robots ]; then
	export ROBOTOLOGY_ROBOTS=$ROBOTOLOGY_ROOT/build/install/share/robots
else
	unset ROBOTOLOGY_ROBOTS
fi
 
