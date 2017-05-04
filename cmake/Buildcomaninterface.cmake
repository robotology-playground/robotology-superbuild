# comaninterface
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(comanmod QUIET)
find_or_build_package(comanapp QUIET)

ycm_ep_helper(  comaninterface
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/comaninterface.git
                TAG master
                COMPONENT robots
                DEPENDS comanmod
                        comanapp
            )
