# arms_ik
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)
find_or_build_package(locoman_utils QUIET)

ycm_ep_helper(  arms_ik 
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/arms_ik.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared
			locoman_utils
			trajectory_generator
            )
