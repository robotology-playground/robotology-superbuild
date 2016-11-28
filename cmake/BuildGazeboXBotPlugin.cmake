# GazeboXBotPlugin
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotCore QUIET)

ycm_ep_helper(  GazeboXBotPlugin
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/gazeboxbotplugin.git
                TAG master
                COMPONENT external
                DEPENDS XBotCore
             )
