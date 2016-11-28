# RobotInterfaceXBotRT
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  RobotInterfaceXBotRT
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/robotinterfacexbotrt.git
                TAG master
                COMPONENT external
		DEPENDS XBotInterface
             )
