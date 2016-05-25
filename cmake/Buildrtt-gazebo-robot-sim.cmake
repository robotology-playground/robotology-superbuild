# rtt-gazebo-robot-sim
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  rtt-gazebo-robot-sim
                TYPE GIT
                STYLE GITHUB
                REPOSITORY cogimon/rtt-gazebo-robot-sim.git
                TAG master
                COMPONENT external
            )
