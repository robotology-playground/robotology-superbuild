# vigir_footstep_planning_msgs
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(rospy QUIET)
find_package(Boost COMPONENTS system QUIET)
find_package(Eigen QUIET)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  vigir_footstep_planning_msgs
                TYPE GIT
                STYLE GITHUB
                REPOSITORY team-vigir/vigir_footstep_planning_msgs.git
                TAG master
                COMPONENT external
                DEPENDS YARP
                        GYM
                        idynutils
            )
