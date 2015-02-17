# GYM
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP 2.3.62.0 QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(paramHelp QUIET)

ycm_ep_helper(GYM   TYPE GIT
                    STYLE GITHUB
                    REPOSITORY robotology-playground/GYM.git
                    TAG master
                    COMPONENT drc
#                    TEST_COMMAND ctest
                    DEPENDS YARP
                            idynutils
                            paramHelp)
