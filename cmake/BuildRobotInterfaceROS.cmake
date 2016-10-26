# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  RobotInterfaceROS
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/robotinterfaceros.git
                TAG devel
                COMPONENT external
		DEPENDS XBotInterface
             )
