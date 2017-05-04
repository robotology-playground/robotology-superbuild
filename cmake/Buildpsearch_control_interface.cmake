# psearch_control_interface
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)

ycm_ep_helper(  psearch_control_interface 
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/psearch_control_interface.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared
            )
