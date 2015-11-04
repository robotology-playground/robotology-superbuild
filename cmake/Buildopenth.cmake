# openth
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(moveit_compute_default_collisions REQUIRED QUIET)

ycm_ep_helper(openth TYPE GIT
                             STYLE GITHUB
                             REPOSITORY OpenTheta/openth.git
                             TAG master
                             COMPONENT robots
                             DEPENDS moveit_compute_default_collisions
                             INSTALL_COMMAND "")
