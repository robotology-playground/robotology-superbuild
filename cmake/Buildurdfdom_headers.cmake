# urdfdom_headers
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(console_bridge QUIET)

ycm_ep_helper(urdfdom_headers TYPE GIT
              STYLE GITHUB
              REPOSITORY ros/urdfdom_headers.git
              TAG master
              COMPONENT external
              DEPENDS console_bridge)
