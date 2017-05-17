# walkman_fireman
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)

ycm_ep_helper(  walkman_fireman
                TYPE GIT
                STYLE GITHUB
                REPOSITORY CentroEPiaggio/walkman_fireman.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared idynutils GYM wholebody_ik
            )