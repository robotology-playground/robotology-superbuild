# vigir_footstep_planning_msgs
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)
ycm_ep_helper(  vigir_footstep_planning_msgs
                TYPE GIT
                STYLE GITHUB
                REPOSITORY team-vigir/vigir_footstep_planning_msgs.git
                TAG master
                COMPONENT vigir
            )
