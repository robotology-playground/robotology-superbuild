# drc_shared
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  drc_shared
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/drc_shared.git
                TAG master
                COMPONENT drc
                DEPENDS YARP
            )
