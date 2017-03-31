# walking
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(iDynTree QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(drc_shared QUIET)


ycm_ep_helper(  walking
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/walking.git
                TAG master
                COMPONENT robots
                DEPENDS iDynTree
                        GYM
			drc_shared
            )
