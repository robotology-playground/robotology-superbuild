# XBotCore
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  XBotCore-interfaces
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/xbotcore-interfaces.git
                TAG master 
                COMPONENT external 
              )
