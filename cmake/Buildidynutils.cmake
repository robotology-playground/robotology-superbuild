# idynutils
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(iDynTree QUIET)
find_or_build_package(kdl_codyco QUIET)
find_or_build_package(kdl_format_io QUIET)
find_or_build_package(orocos_kdl QUIET)
find_or_build_package(YARP 2.3.62.0 QUIET)

ycm_ep_helper(idynutils TYPE GIT
                        STYLE GITHUB
                        REPOSITORY robotology-playground/idynutils.git
                        TAG master
                        COMPONENT external
#                       TEST_COMMAND ctest
                        DEPENDS YARP
                                iDynTree
                                orocos_kdl
                                kdl_codyco
                                kdl_format_io)
