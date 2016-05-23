# rtt-gazebo-lwr4plus-sim
include(YCMEPHelper)
include(FindOrBuildPackage)


ycm_ep_helper(  rtt-gazebo-lwr4plus-sim
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt-gazebo-lwr4plus-sim.git
                TAG master
                COMPONENT external
            )
