cmake_minimum_required(VERSION 2.8.12)
project(robotology NONE)

## we have to enable C because it is currently used
## by CMake to describe packages (in Config*.cmake files)
enable_language(C)

# Set profile directory as first directory in the path, in order to
# be able to build subprojects with different flags depending on
# the profile
set(ROBOTOLOGY_PROFILE "$ENV{ROBOTOLOGY_PROFILE}")
if(NOT ROBOTOLOGY_PROFILE)
  set(ROBOTOLOGY_PROFILE "DEFAULT")
endif()
string(TOLOWER "${ROBOTOLOGY_PROFILE}" profile_dir)
set(profile_dir ${CMAKE_SOURCE_DIR}/profiles/${profile_dir}/cmake)
if(EXISTS ${profile_dir})
  list(APPEND CMAKE_MODULE_PATH ${profile_dir})
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(ROBOTOLOGY_MAJOR_VERSION 1)
set(ROBOTOLOGY_MINOR_VERSION 0)
set(ROBOTOLOGY_PATCH_VERSION 0)
set(ROBOTOLOGY_VERSION ${ROBOTOLOGY_MAJOR_VERSION}.${ROBOTOLOGY_MINOR_VERSION}.${ROBOTOLOGY_PATCH_VERSION})

set(YCM_EP_MAINTAINER_MODE FALSE)

include(CTest)
include(FeatureSummary)

set(YCM_GIT_GITLAB_ROBOTOLOGY_BASE_ADDRESS "https://gitlab.robotology.eu/" CACHE STRING "Address to use for Robotology Gitlab git repositories" FORCE)
set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

include(ProjectsTags OPTIONAL)

# Bootstrap YCM
include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

set(USE_SYSTEM_YARP OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_KDL_CODYCO OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_IDYNTREE OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_PARAMHELP OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_OPENSOT OFF CACHE BOOL "Initial cache")

# Only open source repo by default
set(USE_ONLY_OPEN_SOURCE ON CACHE BOOL "Only the open-source repo will be cloned and built")
# Tokyo University HYDRA OFF by default
set(YNL_HYDRA_TOKYO_UNIVERSITY OFF CACHE BOOL "Enable the download and usages of repos from University of Tokyo YNL Lab")

# ------------------------------------
# Superbuild CORE - compile it always.
# ------------------------------------
find_or_build_package(YARP)
find_or_build_package(iDynTree)
find_or_build_package(idynutils)
find_or_build_package(OpenSoT)
find_or_build_package(GYM)
find_or_build_package(paramHelp)
find_or_build_package(GazeboYARPPlugins)

#------
# Model
#------
# Compile COMAN model
set(SUPERBUILD_IITComanRosPkg ON CACHE BOOL "Flag to compile IITComanRosPkg")
IF(SUPERBUILD_IITComanRosPkg)
	find_or_build_package(IITComanRosPkg)
ENDIF(SUPERBUILD_IITComanRosPkg)
# Compile iCub model
set(SUPERBUILD_icub_gazebo ON CACHE BOOL "Flag to compile icub_gazebo")
IF(SUPERBUILD_icub_gazebo)
        find_or_build_package(icub_gazebo)
ENDIF(SUPERBUILD_icub_gazebo)

# -------------------------------------------
# Compile CAPSULE for the collision avoidance
# -------------------------------------------
set(SUPERBUILD_CAPSULE ON CACHE BOOL "Flag to compile roboptim-core, moveit_compute_default_collisions, roboptim-capsule, roboptim-core-plugin-ipopt, robot_capsule_generator")
IF(SUPERBUILD_CAPSULE)
	find_or_build_package(roboptim-core)
	find_or_build_package(moveit_compute_default_collisions)
	find_or_build_package(roboptim-capsule)
	find_or_build_package(roboptim-core-plugin-ipopt)
	find_or_build_package(robot_capsule_generator)
ENDIF(SUPERBUILD_CAPSULE)

# ---------------------
# Compile simple_homing
# ---------------------
set(SUPERBUILD_simple_homing ON CACHE BOOL "Flag to compile simple_homing")
IF(SUPERBUILD_simple_homing)
	find_or_build_package(simple_homing)
ENDIF(SUPERBUILD_simple_homing)

# --------------------------------------
# Compile centralized_inverse_kinematics
# --------------------------------------
set(SUPERBUILD_centralized_inverse_kinematics OFF CACHE BOOL "Flag to compile centralized_inverse_kinematics")
IF(SUPERBUILD_centralized_inverse_kinematics)
	find_or_build_package(centralized_inverse_kinematics)
ENDIF(SUPERBUILD_centralized_inverse_kinematics)

# --------------------------------------
# Compile testQPsolvers - OFF by default
# --------------------------------------
set(SUPERBUILD_testQPsolvers OFF CACHE BOOL "Flag to compile testQPsolvers")
IF(SUPERBUILD_testQPsolvers)
	find_or_build_package(testQPsolvers)
ENDIF(SUPERBUILD_testQPsolvers)

# --------------------------------------
# Compile athletic - OFF by default
# --------------------------------------
set(SUPERBUILD_athletic OFF CACHE BOOL "Flag to compile athletic")
IF(SUPERBUILD_athletic)
	find_or_build_package(athletic)
ENDIF(SUPERBUILD_athletic)

# --------------------------------------
# Compile yarp_ros_joint_state_publisher
# --------------------------------------
set(SUPERBUILD_yarp_ros_joint_state_publisher ON CACHE BOOL "Flag to compile yarp_ros_joint_state_publisher")
IF(SUPERBUILD_yarp_ros_joint_state_publisher)
        find_or_build_package(yarp_ros_joint_state_publisher)
ENDIF(SUPERBUILD_yarp_ros_joint_state_publisher)
# --------------------------------------
# Compile robot_state_publisher_ext
# --------------------------------------
set(SUPERBUILD_robot_state_publisher_ext ON CACHE BOOL "Flag to compile robot_state_publisher_ext")
IF(SUPERBUILD_robot_state_publisher_ext)
        find_or_build_package(robot_state_publisher_ext)
ENDIF(SUPERBUILD_robot_state_publisher_ext)

# ---------------------
# Compile locoman_utils
# ---------------------
set(SUPERBUILD_locoman_utils OFF CACHE BOOL "Flag to compile locoman_utils")
IF(SUPERBUILD_locoman_utils)
    find_or_build_package(locoman_utils)
ENDIF(SUPERBUILD_locoman_utils)


IF(NOT USE_ONLY_OPEN_SOURCE)
	# set ssh connection with gitlab using rsa keys.
	set(YCM_GIT_GITLAB_ROBOTOLOGY_BASE_ADDRESS "ssh://git@gitlab.robotology.eu/" CACHE STRING "Address to use for Robotology Gitlab git repositories" FORCE)

	# --------------------------------------
        # Compile drc_shared
        # --------------------------------------
	set(SUPERBUILD_drc_shared ON CACHE BOOL "Flag to compile drc_shared")
        IF(SUPERBUILD_drc_shared)
            find_or_build_package(drc_shared)
        ENDIF(SUPERBUILD_drc_shared)
        
        # --------------------------------------
        # Compile trajectory_generator
        # --------------------------------------
        set(SUPERBUILD_trajectory_generator ON CACHE BOOL "Flag to compile trajectory_generator")
        IF(SUPERBUILD_trajectory_generator)
            find_or_build_package(trajectory_generator)
        ENDIF(SUPERBUILD_trajectory_generator)
        
        # --------------------------------------
        # Compile iit-bigman-ros-pkg
        # --------------------------------------
        set(SUPERBUILD_iit-bigman-ros-pkg ON CACHE BOOL "Flag to compile iit-bigman-ros-pkg")
        IF(SUPERBUILD_iit-bigman-ros-pkg)
            find_or_build_package(iit-bigman-ros-pkg)
        ENDIF(SUPERBUILD_iit-bigman-ros-pkg)
        
        # --------------------------------------
        # Compile drc_poses
        # --------------------------------------
        set(SUPERBUILD_drc_poses OFF CACHE BOOL "Flag to compile drc_poses")
        IF(SUPERBUILD_drc_poses)
            find_or_build_package(drc_poses)
        ENDIF(SUPERBUILD_drc_poses)
        
        # --------------------------------------
        # Compile walking
        # --------------------------------------
        set(SUPERBUILD_walking OFF CACHE BOOL "Flag to compile walking")
        IF(SUPERBUILD_walking)
            find_or_build_package(walking)
        ENDIF(SUPERBUILD_walking)
        
        # --------------------------------------
        # Compile drc_valve
        # --------------------------------------
        set(SUPERBUILD_drc_valve OFF CACHE BOOL "Flag to compile drc_valve")
        IF(SUPERBUILD_drc_valve)
            find_or_build_package(drc_valve)
        ENDIF(SUPERBUILD_drc_valve)
        
        # --------------------------------------
        # Compile drc_plug
        # --------------------------------------
        set(SUPERBUILD_drc_plug OFF CACHE BOOL "Flag to compile drc_plug")
        IF(SUPERBUILD_drc_plug)
            find_or_build_package(drc_plug)
        ENDIF(SUPERBUILD_drc_plug)


	# --------------------------------------
        # Compile network
        # --------------------------------------
        set(SUPERBUILD_network OFF CACHE BOOL "Flag to compile network")
        IF(SUPERBUILD_network)
            find_or_build_package(network)
        ENDIF(SUPERBUILD_network)

	# --------------------------------------
        # Compile footstep_perception
        # --------------------------------------
        set(SUPERBUILD_footstep_perception OFF CACHE BOOL "Flag to compile footstep_perception")
        IF(SUPERBUILD_footstep_perception)
            find_or_build_package(footstep_perception)
        ENDIF(SUPERBUILD_footstep_perception)
        
	# --------------------------------------
        # Compile locomanipulation
        # --------------------------------------
        set(SUPERBUILD_locomanipulation OFF CACHE BOOL "Flag to compile locomanipulation")
        IF(SUPERBUILD_locomanipulation)
            find_or_build_package(locomanipulation)
            find_or_build_package(locoman_utils)
        ENDIF(SUPERBUILD_locomanipulation)


	IF("${ROBOTOLOGY_PROFILE}" STREQUAL "ROBOT")
	
		find_or_build_package(comaninterface)
    		find_or_build_package(comanmod)
		find_or_build_package(comanapp)
		find_or_build_package(COMAN_shared)

	ENDIF("${ROBOTOLOGY_PROFILE}" STREQUAL "ROBOT")

ENDIF(NOT USE_ONLY_OPEN_SOURCE)

IF(YNL_HYDRA_TOKYO_UNIVERSITY)
	find_or_build_package(openth)
ENDIF(YNL_HYDRA_TOKYO_UNIVERSITY)



set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
