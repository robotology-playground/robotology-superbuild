# iDynTree
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(orocos_kdl QUIET)
find_or_build_package(kdl_codyco QUIET)
find_or_build_package(kdl_format_io QUIET)


ycm_ep_helper(  iDynTree
                TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology-playground/iDynTree.git
                TAG master
                COMPONENT external
                DEPENDS YARP
                        orocos_kdl
                        kdl_codyco
                        kdl_format_io
                CMAKE_CACHE_ARGS -DIDYNTREE_USES_ICUB_MAIN:BOOL=OFF
            )
