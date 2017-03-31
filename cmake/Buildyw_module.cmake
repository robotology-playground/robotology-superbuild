# state_listener
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(iDynTree QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(idynutils QUIET)

ycm_ep_helper(yw_module TYPE GIT
              STYLE GITHUB
              REPOSITORY ADVRHumanoids/yw_module.git
              TAG master
              COMPONENT robots
              DEPENDS iDynTree
                      GYM
                      idynutils
                      YARP)
