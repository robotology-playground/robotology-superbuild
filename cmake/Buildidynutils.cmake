# idynutils
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(iDynTree QUIET)
find_or_build_package(fcl QUIET)

ycm_ep_helper(  idynutils
                TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology-playground/idynutils.git
                TAG master
                COMPONENT external
                DEPENDS YARP
                        iDynTree
                        fcl
            )
