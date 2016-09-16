# comanapp
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  comanapp
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/comanapp.git
                TAG master
                COMPONENT drc
                DEPENDS YARP
            )
