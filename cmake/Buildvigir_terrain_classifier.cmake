# vigir_terrain_classifier
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(vigir_generic_params QUIET)

ycm_ep_helper ( vigir_terrain_classifier
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/vigir_terrain_classifier.git
                TAG master
                COMPONENT vigir
                DEPENDS vigir_footstep_planning_basics
                        #vigir_footstep_planning_core
                        vigir_footstep_planning_msgs
                )
