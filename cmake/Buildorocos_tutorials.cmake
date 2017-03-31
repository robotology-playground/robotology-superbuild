# orocos_tutorials
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  orocos_tutorials
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/orocos_tutorials.git
                TAG master
                COMPONENT external
                INSTALL_COMMAND ""
            )
