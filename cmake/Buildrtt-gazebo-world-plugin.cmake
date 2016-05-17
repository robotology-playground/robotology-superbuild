# rtt-gazebo-world-plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)
find_or_build_package(RSC QUIET)
find_or_build_package(RSB QUIET)
find_or_build_package(RST QUIET)

ycm_ep_helper(  rtt-gazebo-world-plugin
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt-gazebo-world-plugin.git
                TAG master
                COMPONENT external
                DEPENDS RSC
                        RSB
                        RST
                INSTALL_COMMAND ""
            )
