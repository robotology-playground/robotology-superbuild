# iDynTree
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(orocos_kdl QUIET)


ycm_ep_helper(iDynTree TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology-playground/iDynTree.git
              TAG master
              COMPONENT external
              DEPENDS YARP
                      orocos_kdl
	     	  CMAKE_CACHE_ARGS -DIDYNTREE_USES_ICUB_MAIN:BOOL=OFF)
