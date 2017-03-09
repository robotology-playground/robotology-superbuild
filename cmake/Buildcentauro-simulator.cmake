# centauro-simulator
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  centauro-simulator
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY Navvab/centauro-simulator.git
                TAG roscontrol_plugin_handler
                COMPONENT robots
		DEPENDS XCM
		)
