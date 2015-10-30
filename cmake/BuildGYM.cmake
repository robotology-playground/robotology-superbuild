# GYM
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(idynutils QUIET)
find_or_build_package(paramHelp QUIET)

ycm_ep_helper(  GYM
                TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology-playground/GYM.git
                TAG master
                COMPONENT external
                DEPENDS idynutils
                        paramHelp
            )
