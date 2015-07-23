# walking
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(iDynTree QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(idynutils QUIET)

ycm_ep_helper(walking TYPE GIT
                      STYLE GITLAB_ROBOTOLOGY
                      REPOSITORY walkman-drc/walking.git
                      TAG master
                      COMPONENT robots
                      DEPENDS iDynTree
                              GYM
                              idynutils
                              YARP)
