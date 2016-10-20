# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  ModelInterfaceRBDL
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/modelinterfacerbdl.git
                TAG master
                COMPONENT external
             )
