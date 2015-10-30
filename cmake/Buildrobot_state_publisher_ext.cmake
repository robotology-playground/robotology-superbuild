# robot_state_publisher_ext
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(rospy QUIET)
find_package(Boost COMPONENTS system QUIET)
find_package(Eigen QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(TinyXML QUIET)
find_or_build_package(iDynTree QUIET)

ycm_ep_helper(  robot_state_publisher_ext
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/robot_state_publisher_ext.git
                TAG master
                COMPONENT external
                DEPENDS GYM
                        TinyXML
                        iDynTree
            )
