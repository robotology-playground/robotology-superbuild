# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  RobotInterfaceROS
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/robotinterfaceros.git
                TAG devel
                COMPONENT external
             )
