# centauro-simulator
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  centauro-simulator
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY jlee/centauro-simulator.git
                TAG master
                COMPONENT robots
		)
