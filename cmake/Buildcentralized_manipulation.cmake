# centralized_manipulation
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_utils QUIET)

ycm_ep_helper(  centralized_manipulation
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/centralized_manipulation.git
                TAG master
                COMPONENT robots
                DEPENDS OpenSoT
			GYM
			trajectory_utils
            )
