# DRC poses
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)
find_or_build_package(Eigen QUIET)

ycm_ep_helper(  drc_poses
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/drc_poses.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared
                        GYM
			trajectory_generator
            )
