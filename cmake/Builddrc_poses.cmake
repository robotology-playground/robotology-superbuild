# DRC poses
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)

ycm_ep_helper(  drc_poses
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/drc_poses.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared
                        GYM
            )
