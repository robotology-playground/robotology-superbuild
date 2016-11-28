cmake_minimum_required(VERSION 2.8.12)

set(YCM_GIT_GITLAB_ADVRCLOUD_BASE_ADDRESS "ssh://git@gitlab.advrcloud.iit.it/" CACHE STRING "Address to use for ADVR cloud Gitlab git repositories" FORCE)
set(YCM_GIT_GITLAB_BASE_ADDRESS "ssh://git@gitlab.com/" CACHE STRING "Address to use for GITLAB.com repos" FORCE)


# --------------------------------------
# Compile bigman
# --------------------------------------
find_or_build_package_with_tag(bigman-ros OFF)

# --------------------------------------
# Compile RobotInterfaceROS_CommandArray
# --------------------------------------
find_or_build_package_with_tag(RobotInterfaceROS_CommandArray OFF)



