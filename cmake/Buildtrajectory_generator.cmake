# trajectory_generator
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP)
find_or_build_package(drc_shared)
find_or_build_package(idynutils)
find_or_build_package(GYM)

ycm_ep_helper(trajectory_generator TYPE GIT
                            STYLE GITLAB_ROBOTOLOGY
                            REPOSITORY walkman-drc/trajectory_generator.git
                            TAG master
                            COMPONENT external
                            DEPENDS YARP
                                    drc_shared
                                    idynutils
                                    GYM
                                    trajectory_generator)
