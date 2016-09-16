# gaze_control
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)

ycm_ep_helper(  gaze_control 
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/gaze_control.git
                TAG master
                COMPONENT drc
                DEPENDS drc_shared
            )