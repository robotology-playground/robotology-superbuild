# rtt-gazebo-clock-plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  rtt-gazebo-clock-plugin
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt-gazebo-clock-plugin.git
                TAG master
                COMPONENT external
            )
