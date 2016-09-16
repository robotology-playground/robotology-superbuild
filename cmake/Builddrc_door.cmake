# Door
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)
find_or_build_package(drc_shared QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)
find_or_build_package(walking QUIET)

ycm_ep_helper(drc_door TYPE GIT
                        STYLE GITLAB_ROBOTOLOGY
                        REPOSITORY walkman-drc/drc_door.git
                        TAG master
                        COMPONENT drc
                        DEPENDS OpenSoT
                                drc_shared
                                idynutils
                                GYM
                                trajectory_generator
                                walking)

