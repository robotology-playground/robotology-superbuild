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

include(CTest)
include(FeatureSummary)


set(YCM_GIT_GITLAB_ICUB_ORG_BASE_ADDRESS "ssh://git@gitlab.icub.org/" CACHE STRING "Address to use for IIT iCub Facility Gitlab git repositories")
set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

include(ProjectsTags OPTIONAL)

# Bootstrap YCM
include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

# find_or_build_package(ECM)
# find_or_build_package(TinyXML)
# find_or_build_package(SQLite)
# find_or_build_package(GooCanvas)
# find_or_build_package(GooCanvasMM)
# find_or_build_package(GtkDatabox)
# find_or_build_package(GtkDataboxMM)

set(USE_SYSTEM_YARP OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_ICUB OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_CODYCO OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_KDL_CODYCO OFF CACHE BOOL "Initial cache")
set(USE_SYSTEM_COMAN_SHARED OFF CACHE BOOL "Initial cache")
#set(USE_SYSTEM_RVIZ OFF CACHE BOOL "Initial cache")

find_or_build_package(YARP 2.3.60)
find_or_build_package(ICUB)
find_or_build_package(iDynTree)
find_or_build_package(COMAN_shared)

find_or_build_package(IITComanRosPkg)
find_or_build_package(icub_gazebo)

# Packages not useful on robot
if(NOT "${ROBOTOLOGY_PROFILE}" STREQUAL "ROBOT")
    find_or_build_package(GazeboYARPPlugins)
endif()


set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
