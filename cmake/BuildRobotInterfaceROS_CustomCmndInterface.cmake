# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(RobotInterfaceROS QUIET)
find_or_build_package(centauro-simulator QUIET)

ycm_ep_helper(  RobotInterfaceROS_CustomCmndInterface
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/robotinterfaceros_customcmndinterface.git
                TAG master
                COMPONENT ros_messages
		DEPENDS RobotInterfaceROS
			centauro-simulator
             )
