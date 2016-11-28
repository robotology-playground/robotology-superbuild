cmake_minimum_required(VERSION 2.8.12)

set(YCM_GIT_GITLAB_ADVRCLOUD_BASE_ADDRESS "ssh://git@gitlab.advrcloud.iit.it/" CACHE STRING "Address to use for ADVR cloud Gitlab git repositories" FORCE)

# Using Walk-Man Demos related projects OFF by default
set(USE_WALKMAN_DEMOS_PROJECTS OFF CACHE BOOL "Enable the download and usages of repos related to the Walk-Man project demos")

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
    find_or_build_package(yarp_ros_joint_state_publisher)
    find_or_build_package(upper_body_control)
    find_or_build_package(ModelInterfaceRBDL)
ENDIF(USE_WALKMAN_DEMOS_PROJECTS)

# --------------------------------------
# Compile ReactiveWalk
# --------------------------------------
find_or_build_package_with_tag(ReactiveWalk OFF)

# --------------------------------------
# Compile reactive_walking
# --------------------------------------
find_or_build_package_with_tag(reactive_walking OFF)
