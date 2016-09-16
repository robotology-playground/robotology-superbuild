# PI
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)

ycm_ep_helper(  pilot_interface 
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/pilot_interface.git
                TAG master
                COMPONENT drc
                DEPENDS drc_shared
                        GYM
                        trajectory_generator
            )