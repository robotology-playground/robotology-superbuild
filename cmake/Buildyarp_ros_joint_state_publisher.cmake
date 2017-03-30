# yarp_ros_joint_state_publisher
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(rospy QUIET)
find_package(Boost COMPONENTS system QUIET)
find_package(Eigen QUIET)

find_or_build_package(YARP QUIET)

ycm_ep_helper(  yarp_ros_joint_state_publisher
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/yarp_ros_joint_state_publisher.git
                TAG master
                COMPONENT external
                DEPENDS YARP
                        GYM
                        idynutils
            )
