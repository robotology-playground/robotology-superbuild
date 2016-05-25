# cogimon-scenarios
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  cogimon-scenarios
                TYPE GIT
                STYLE GITHUB
                REPOSITORY cogimon/cogimon-scenarios.git
                TAG master
                COMPONENT external
            )
