# xbotcoremodel
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  xbotcoremodel
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/xbotcoremodel.git
                TAG master
                COMPONENT external
            )
