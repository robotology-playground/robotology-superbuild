# vigir_footstep_planning_basics
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)

ycm_ep_helper(  vigir_footstep_planning_basics
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/vigir_footstep_planning_basics.git
                TAG master
                COMPONENT vigir
                DEPEND vigir_pluginlib
            )
