# rtt-gazebo-coman-sim
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  rtt-gazebo-coman-sim
                TYPE GIT
                STYLE GITHUB
                REPOSITORY cogimon/rtt-gazebo-coman-sim.git
                TAG master
                COMPONENT external
            )
