# rtt-rrct-typekit
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  rtt-rrct-typekit
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt-rrct-typekit.git
                TAG master
                COMPONENT external
            )
