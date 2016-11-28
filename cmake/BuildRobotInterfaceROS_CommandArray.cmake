# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(RobotInterfaceROS QUIET)
find_or_build_package(bigman-ros QUIET)

ycm_ep_helper(  RobotInterfaceROS_CommandArray
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/robotinterfaceros_commandarray.git
                TAG master
                COMPONENT ros_messages
		DEPENDS RobotInterfaceROS
			bigman-ros
             )
