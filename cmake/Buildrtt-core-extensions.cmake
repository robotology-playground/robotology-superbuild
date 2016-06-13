# rtt-core-extensions
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  rtt-core-extensions
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt-core-extensions.git
                TAG master
                COMPONENT external
            )
