# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  InverseKinematics
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY centauro-simulator-control/inverse_kinematics.git
                TAG master
                COMPONENT external
             )
