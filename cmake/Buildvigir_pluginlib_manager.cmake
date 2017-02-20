# vigir_pluginlib_manager
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)

ycm_ep_helper(  vigir_pluginlib_manager
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/vigir_pluginlib.git
                TAG master
                COMPONENT vigir
            )
