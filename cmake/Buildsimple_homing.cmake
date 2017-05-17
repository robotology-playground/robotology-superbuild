# simple_homing
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)

find_or_build_package(GYM QUIET)

ycm_ep_helper(  simple_homing 
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/simple_homing.git
                TAG master
                COMPONENT robots
                DEPENDS GYM
             )
