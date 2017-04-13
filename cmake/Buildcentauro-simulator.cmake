# centauro-simulator
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  centauro-simulator
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY centauro-simulator-control/centauro-simulator.git
                TAG xbot_control
                COMPONENT robots
                DEPENDS
                BUILD_COMMAND ""
		INSTALL_COMMAND ""
		)
