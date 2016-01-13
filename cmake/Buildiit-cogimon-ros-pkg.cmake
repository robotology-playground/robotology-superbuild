# iit-cogimon-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(moveit_compute_default_collisions REQUIRED QUIET)

ycm_ep_helper(  iit-cogimon-ros-pkg
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY cogimon/iit-cogimon-ros-pkg.git
                TAG master
                COMPONENT robots
                DEPENDS moveit_compute_default_collisions
                INSTALL_COMMAND ""
            )
