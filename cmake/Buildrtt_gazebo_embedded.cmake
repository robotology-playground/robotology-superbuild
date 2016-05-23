# rtt_gazebo_embedded
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  rtt_gazebo_embedded
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt_gazebo_embedded.git
                TAG master
                COMPONENT external
            )
