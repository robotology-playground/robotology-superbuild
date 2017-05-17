# lazarus
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)

ycm_ep_helper(  lazarus
                TYPE GIT
                STYLE GITHUB
                REPOSITORY CentroEPiaggio/lazarus.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared idynutils GYM XBotCoreModel XBotInterface RobotInterfaceYARP ModelInterfaceRBDL
            )