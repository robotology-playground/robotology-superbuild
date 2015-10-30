# urdfdom
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(console_bridge QUIET)
find_or_build_package(urdfdom_headers QUIET)

ycm_ep_helper(  urdfdom
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ros/urdfdom.git
                TAG master
                COMPONENT external
                DEPENDS urdfdom_headers
            )
