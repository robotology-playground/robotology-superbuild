# simple_homing
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)

find_or_build_package(YARP QUIET)
find_or_build_package(ICUB QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(idynutils QUIET)

ycm_ep_helper(simple_homing TYPE GIT
                            STYLE GITLAB_ROBOTOLOGY
                            REPOSITORY walkman-drc/simple_homing.git
                            TAG master
                            COMPONENT robots
                            DEPENDS YARP
                                    ICUB
                                    GYM
                                    idynutils)
