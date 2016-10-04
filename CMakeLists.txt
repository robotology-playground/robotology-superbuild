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

set(ROBOTOLOGY_MAJOR_VERSION 2)
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

#set(USE_SYSTEM_YARP OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_KDL_CODYCO OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_IDYNTREE OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_PARAMHELP OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_OPENSOT OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_IDYNUTILS OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_GYM OFF CACHE BOOL "Initial cache")

# Only open source repo by default
set(USE_ONLY_OPEN_SOURCE ON CACHE BOOL "Only the open-source repo will be cloned and built")
# CORE packages
set(USE_CORE_PACKAGES OFF CACHE BOOL "CORE packages for robotology-superbuild")
# Tokyo University HYDRA OFF by default
set(YNL_HYDRA_TOKYO_UNIVERSITY OFF CACHE BOOL "Enable the download and usages of repos from University of Tokyo YNL Lab")
# Using Walk-Man Demos related projects OFF by default
set(USE_WALKMAN_DEMOS_PROJECTS OFF CACHE BOOL "Enable the download and usages of repos related to the Walk-Man project demos")
# CENTAURO EU Project 
set(CENTAURO_EU OFF CACHE BOOL "Enable the download and usages of repos related to the CENTAURO project")
# COGIMON EU Project 
set(COGIMON_EU OFF CACHE BOOL "Enable the download and usages of repos related to the CoGiMon project")

IF(NOT USE_ONLY_OPEN_SOURCE)
	# set ssh connection with gitlab using rsa keys.
	set(YCM_GIT_GITLAB_ROBOTOLOGY_BASE_ADDRESS "ssh://git@gitlab.robotology.eu/" CACHE STRING "Address to use for Robotology Gitlab git repositories" FORCE)
ENDIF(NOT USE_ONLY_OPEN_SOURCE)

# --------------------------------------
# Compile set of CORE packages
# --------------------------------------
IF(USE_CORE_PACKAGES)
	include(${CMAKE_CURRENT_SOURCE_DIR}/projects/CMakeLists.txt)
ENDIF(USE_CORE_PACKAGES)

# --------------------------------------
# Compile related CENTAURO packages
# --------------------------------------
IF(CENTAURO_EU)
       include(${CMAKE_CURRENT_SOURCE_DIR}/projects/centauro/CMakeLists.txt)
ENDIF(CENTAURO_EU)

# --------------------------------------
# Compile related COGIMON packages
# --------------------------------------
IF(COGIMON_EU)
       include(${CMAKE_CURRENT_SOURCE_DIR}/projects/cogimon/CMakeLists.txt)
ENDIF(COGIMON_EU)

# --------------------------------------
# Compile related TOKYO UNIVERSITY packages
# --------------------------------------
IF(YNL_HYDRA_TOKYO_UNIVERSITY)
	include(${CMAKE_CURRENT_SOURCE_DIR}/projects/tokyo_university_ynl/CMakeLists.txt)
ENDIF(YNL_HYDRA_TOKYO_UNIVERSITY)

IF(USE_WALKMAN_DEMOS_PROJECTS)
    find_or_build_package(drc_shared)
    find_or_build_package(iit-bigman-ros-pkg)
    find_or_build_package(locoman_utils)
    find_or_build_package(arms_ik)
    find_or_build_package(wholebody_ik)
    find_or_build_package(multicontact_control)
    find_or_build_package(multicontact_planning)
    find_or_build_package(walking)
    find_or_build_package(supervisor)
    find_or_build_package(psearch_control_interface)
    find_or_build_package(gaze_control)
    find_or_build_package(pilot_interface)
    find_or_build_package(network)
ENDIF(USE_WALKMAN_DEMOS_PROJECTS)

set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
