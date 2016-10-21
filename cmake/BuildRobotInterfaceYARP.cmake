# RobotInterfaceYARP
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  RobotInterfaceYARP
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/robotinterfaceyarp.git
                TAG master
                COMPONENT external
                DEPENDS YARP
            )
