# vigir_footstep_planning_basics
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(rospy QUIET)
find_package(Boost COMPONENTS system QUIET)
find_package(Eigen QUIET)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  vigir_footstep_planning_basics
                TYPE GIT
                STYLE GITHUB
                REPOSITORY team-vigir/vigir_footstep_planning_basics.git
                TAG master
                COMPONENT external
            )
