# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  centauro_bonn_review_plugins
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/centauro_bonn_review_plugins.git
                TAG master
                COMPONENT external
		DEPENDS XCM
             )
