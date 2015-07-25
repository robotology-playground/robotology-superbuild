# GazeboYARPPlugins
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

ycm_ep_helper(GazeboYARPPlugins TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/gazebo-yarp-plugins.git
              TAG master
              COMPONENT external
              DEPENDS YARP
                      )


