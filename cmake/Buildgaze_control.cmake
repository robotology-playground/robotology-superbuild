# gaze_control
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)

ycm_ep_helper(  gaze_control 
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/gaze_control.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared
            )
