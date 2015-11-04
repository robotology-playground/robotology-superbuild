cmake_minimum_required(VERSION 2.8.7)
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

set(ROBOTOLOGY_MAJOR_VERSION 0)
set(ROBOTOLOGY_MINOR_VERSION 0)
set(ROBOTOLOGY_PATCH_VERSION 1)
set(ROBOTOLOGY_VERSION ${ROBOTOLOGY_MAJOR_VERSION}.${ROBOTOLOGY_MINOR_VERSION}.${ROBOTOLOGY_PATCH_VERSION})

set(YCM_EP_MAINTAINER_MODE TRUE)

include(CTest)
include(FeatureSummary)

set(YCM_GIT_GITLAB_ROBOTOLOGY_BASE_ADDRESS "https://gitlab.robotology.eu/" CACHE STRING "Address to use for Robotology Gitlab git repositories")
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

set(USE_ONLY_OPEN_SOURCE ON CACHE BOOL "Only the open-source repo will be cloned and built")
set(YNL_HYDRA_TOKYO_UNIVERSITY ON CACHE BOOL "Enable the download and usages of repos from University of Tokyo YNL Lab")

find_or_build_package(YARP 2.3.62)
find_or_build_package(iDynTree)
find_or_build_package(paramHelp)

find_or_build_package(roboptim-core)
find_or_build_package(moveit_compute_default_collisions)
find_or_build_package(roboptim-capsule)
find_or_build_package(roboptim-core-plugin-ipopt)
find_or_build_package(robot_capsule_generator)

find_or_build_package(IITComanRosPkg)
find_or_build_package(icub_gazebo)

find_or_build_package(GazeboYARPPlugins)
find_or_build_package(idynutils)
find_or_build_package(OpenSoT)
find_or_build_package(yarp_ros_joint_state_publisher)
find_or_build_package(robot_state_publisher_ext)
find_or_build_package(simple_homing)
find_or_build_package(centralized_inverse_kinematics)
find_or_build_package(GYM)

find_or_build_package(testQPsolvers)

IF(NOT USE_ONLY_OPEN_SOURCE)
        find_or_build_package(drc_shared)
	find_or_build_package(walking)
	find_or_build_package(iit-bigman-ros-pkg)
	find_or_build_package(trajectory_generator)
	find_or_build_package(drc_valve)
	
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
