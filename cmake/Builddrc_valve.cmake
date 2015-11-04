# Valve
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)
find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(trajectory_generator QUIET)

ycm_ep_helper(drc_valve TYPE GIT
                        STYLE GITLAB_ROBOTOLOGY
                        REPOSITORY walkman-drc/drc_valve.git
                        TAG master
                        COMPONENT robots
                        DEPENDS OpenSoT
                                drc_shared
                                GYM
                                idynutils
                                trajectory_generator)
