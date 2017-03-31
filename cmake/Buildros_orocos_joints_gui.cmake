# ros_orocos_joints_gui
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)


ycm_ep_helper(  ros_orocos_joints_gui
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/ros_orocos_joints_gui.git
                TAG master
                COMPONENT external
            )
