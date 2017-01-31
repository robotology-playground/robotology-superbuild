# vigir_pluginlib
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(vigir_generic_params QUIET)

ycm_ep_helper ( vigir_pluginlib
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/vigir_pluginlib.git
                TAG master
                COMPONENT vigir
		DEPENDS vigir_generic_params
              )

