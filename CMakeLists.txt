cmake_minimum_required(VERSION 2.8.12)
project(robotology NONE)

macro(find_or_build_package_with_tag project_name enabled)
       set(SUPERBUILD_${project_name} ${enabled} CACHE BOOL "Flag to compile ${project_name}")
       IF(SUPERBUILD_${project_name})
	       find_or_build_package(${project_name})
       ENDIF(SUPERBUILD_${project_name})
endmacro(find_or_build_package_with_tag) 

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
# Using Walk-Man Demos related projects OFF by default
set(USE_WALKMAN_DEMOS_PROJECTS OFF CACHE BOOL "Enable the download and usages of repos related to the Walk-Man project demos")

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
find_or_build_package_with_tag(IITComanRosPkg ON)
# Compile iCub model
find_or_build_package_with_tag(icub_gazebo ON)
# Compile cogimon model
find_or_build_package_with_tag(iit-cogimon-ros-pkg OFF)

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
find_or_build_package_with_tag(simple_homing ON)

# ---------------------
# Compile cogimon_simulation_tests
# ---------------------
find_or_build_package_with_tag(cogimon_simulation_tests OFF)

# ---------------------
# Compile orocos_tutorials
# ---------------------
find_or_build_package_with_tag(orocos_tutorials OFF)

# ---------------------
# Compile rtt-gazebo-world-plugin
# ---------------------
set(SUPERBUILD_rtt_gazebo_plugins OFF CACHE BOOL "Flag to compile rtt-gazebo-plugins")
IF(SUPERBUILD_rtt_gazebo_plugins)
       find_or_build_package(RSC)
       find_or_build_package(RSB_Protocol)
       find_or_build_package(RSB)
       find_or_build_package(RSB_Tools_cpp)
       find_or_build_package(RST)
       find_or_build_package(RST_RT)
       find_or_build_package(rst-converters)
       find_or_build_package(rtt_gazebo_embedded)
       find_or_build_package(rtt-gazebo-clock-plugin)
       find_or_build_package(rtt-gazebo-lwr4plus-sim)
       find_or_build_package(cogimon-scenarios)
       find_or_build_package(rtt-rrct-typekit)
       find_or_build_package(rtt-rsb-transport)
       find_or_build_package(cogimon-experimental)
ENDIF(SUPERBUILD_rtt_gazebo_plugins)

# --------------------------------------
# Compile rtt_gazebo_robot_sim
# --------------------------------------
find_or_build_package_with_tag(rtt_gazebo_robot_sim OFF)

# --------------------------------------
# Compile centralized_inverse_kinematics
# --------------------------------------
find_or_build_package_with_tag(centralized_inverse_kinematics OFF)

# --------------------------------------
# Compile testQPsolvers - OFF by default
# --------------------------------------
find_or_build_package_with_tag(testQPsolvers OFF)

# --------------------------------------
# Compile athletic - OFF by default
# --------------------------------------
find_or_build_package_with_tag(athletic OFF)

# --------------------------------------
# Compile yarp_ros_joint_state_publisher
# --------------------------------------
find_or_build_package_with_tag(yarp_ros_joint_state_publisher ON)

# --------------------------------------
# Compile robot_state_publisher_ext
# --------------------------------------
find_or_build_package_with_tag(robot_state_publisher_ext ON)

# ---------------------
# Compile ft_publisher
# ---------------------
find_or_build_package_with_tag(ft_publisher OFF)

# ---------------------
# Compile locoman_utils
# ---------------------
find_or_build_package_with_tag(locoman_utils OFF)

# --------------------------------------
# Compile drc_shared
# --------------------------------------
find_or_build_package_with_tag(drc_shared OFF)

# --------------------------------------
# Compile trajectory_generator
# --------------------------------------
find_or_build_package_with_tag(trajectory_generator OFF)

# --------------------------------------
# Compile drc_poses
# --------------------------------------
find_or_build_package_with_tag(drc_poses OFF)

# --------------------------------------
# Compile drc_plug
# --------------------------------------
find_or_build_package_with_tag(drc_plug OFF)

# --------------------------------------
# Compile pilot_interface
# --------------------------------------
find_or_build_package_with_tag(pilot_interface OFF)

# --------------------------------------
# Compile network
# --------------------------------------
find_or_build_package_with_tag(network OFF)

# --------------------------------------
# Compile robotran predictor modules
# --------------------------------------
set(SUPERBUILD_robotran_predictor OFF CACHE BOOL "Flag to compile Robotran predictor modules")
IF(SUPERBUILD_robotran_predictor)
    find_or_build_package(robotran_predictor)
    find_or_build_package(robotran_predictor_ctrl_test)
ENDIF(SUPERBUILD_robotran_predictor)

IF(NOT USE_ONLY_OPEN_SOURCE)
	# set ssh connection with gitlab using rsa keys.
	set(YCM_GIT_GITLAB_ROBOTOLOGY_BASE_ADDRESS "ssh://git@gitlab.robotology.eu/" CACHE STRING "Address to use for Robotology Gitlab git repositories" FORCE)

        # --------------------------------------
        # Compile iit-bigman-ros-pkg
        # --------------------------------------
        find_or_build_package_with_tag(iit-bigman-ros-pkg ON)
        
        # --------------------------------------
        # Compile walking
        # --------------------------------------
        find_or_build_package_with_tag(walking OFF)
        
        # --------------------------------------
        # Compile drc_valve
        # --------------------------------------
        find_or_build_package_with_tag(drc_valve OFF)

        # --------------------------------------
        # Compile drc_raise
        # --------------------------------------
        find_or_build_package_with_tag(drc_raise OFF)

        # --------------------------------------
        # Compile arms_ik
        # --------------------------------------
        find_or_build_package_with_tag(arms_ik OFF)

        # --------------------------------------
        # Compile footstep_perception
        # --------------------------------------
        find_or_build_package_with_tag(footstep_perception OFF)

        # --------------------------------------
        # Compile drcsim
        # --------------------------------------
        find_or_build_package_with_tag(drcsim OFF)


        # --------------------------------------
        # Compile locomanipulation
        # --------------------------------------
        set(SUPERBUILD_locomanipulation OFF CACHE BOOL "Flag to compile locomanipulation")
        IF(SUPERBUILD_locomanipulation)
            find_or_build_package(locomanipulation)
            find_or_build_package(locoman_utils)
	    find_or_build_package(locoman_service_1)
	    find_or_build_package(locoman_service_2)
        ENDIF(SUPERBUILD_locomanipulation)

        # --------------------------------------
        # Compile yw_module
        # --------------------------------------
        find_or_build_package_with_tag(yw_module OFF)

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

IF(USE_WALKMAN_DEMOS_PROJECTS)
    find_or_build_package(drc_shared)
    find_or_build_package(drc_raise)
    find_or_build_package(iit-bigman-ros-pkg)
    find_or_build_package(locoman_utils)
    find_or_build_package(arms_ik)
ENDIF(USE_WALKMAN_DEMOS_PROJECTS)

set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
