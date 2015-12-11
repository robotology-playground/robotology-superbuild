# GYM
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(idynutils QUIET)
find_or_build_package(paramHelp QUIET)
find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(  athletic
                TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology-playground/athletic.git
                TAG master
                COMPONENT external
                DEPENDS idynutils
                        paramHelp
			OpenSoT
            )
