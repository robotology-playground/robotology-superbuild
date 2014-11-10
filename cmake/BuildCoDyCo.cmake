# CoDyCo
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(ICUB QUIET)
find_or_build_package(orocos_kdl QUIET)
find_or_build_package(kdl_codyco QUIET)

ycm_ep_helper(CoDyCo TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/codyco.git
              TAG master
              COMPONENT external
              DEPENDS YARP
                      ICUB
                      orocos_kdl
                      kdl_codyco)
