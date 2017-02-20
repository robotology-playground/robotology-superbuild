# XBotYARP
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(XBotCoreModel QUIET)
find_or_build_package(XBotCore-interfaces QUIET)

ycm_ep_helper(  XBotYARP
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY luca.muratore/xbotyarp.git
                TAG master
                COMPONENT external
                DEPENDS XBotCoreModel
			YARP
			XBotCore-interfaces	
            )
