# drc_shared
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)

find_or_build_package(YARP QUIET)
find_or_build_package(YCM QUIET)

ycm_ep_helper(  drc_shared
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/drc_shared.git
                TAG master
                COMPONENT robots
                DEPENDS YARP
            )
