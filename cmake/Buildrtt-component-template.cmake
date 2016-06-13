# rtt-component-template
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)
find_package(rtt-core-extensions QUIET)

ycm_ep_helper(  rtt-component-template
                TYPE GIT
                STYLE GITHUB
                REPOSITORY cogimon/rtt-component-template.git
                TAG master
                COMPONENT external
                DEPENDS rtt-core-extensions
            )
