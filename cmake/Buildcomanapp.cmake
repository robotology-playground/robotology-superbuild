# comanapp
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  comanapp
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/comanapp.git
                TAG master
                COMPONENT robots
                DEPENDS YARP
            )
