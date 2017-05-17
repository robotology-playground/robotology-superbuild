# centralized_inverse_kinematics
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(  centralized_inverse_kinematics
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/centralized_inverse_kinematics.git
                TAG master
                COMPONENT robots
                INSTALL_COMMAND ""
                DEPENDS OpenSoT
            )
