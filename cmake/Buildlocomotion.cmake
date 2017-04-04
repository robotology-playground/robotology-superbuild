# locomotion
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(iDynTree QUIET)
find_or_build_package(GYM QUIET)


ycm_ep_helper(  locomotion
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/locomotion.git
                TAG master
                COMPONENT robots
                DEPENDS iDynTree
                        GYM
            )
