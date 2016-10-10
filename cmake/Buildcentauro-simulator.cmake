# centauro-simulator
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)

ycm_ep_helper(  centauro-simulator
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY Navvab/centauro-simulator.git
                TAG master
                COMPONENT robots
		)
