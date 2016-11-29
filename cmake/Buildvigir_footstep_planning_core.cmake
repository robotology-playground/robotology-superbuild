# vigir_footstep_planning_core
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)
ycm_ep_helper(  vigir_footstep_planning_core
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/vigir_footstep_planning_core.git
                TAG master
                COMPONENT vigir
                DEPENDS vigir_footstep_planning_basics
                        vigir_footstep_planning_default_plugins
                        vigir_terrain_classifier
            )
