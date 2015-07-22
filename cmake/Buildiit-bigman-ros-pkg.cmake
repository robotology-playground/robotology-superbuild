# iit-bigman-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(moveit_compute_default_collisions REQUIRED QUIET)

ycm_ep_helper(iit-bigman-ros-pkg TYPE GIT
                             STYLE GITLAB_ROBOTOLOGY
                             REPOSITORY walkman-drc/iit-bigman-ros-pkg.git
                             TAG master
                             COMPONENT drc
                             DEPENDS moveit_compute_default_collisions
                             INSTALL_COMMAND "")
