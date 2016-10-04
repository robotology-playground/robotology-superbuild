# XBotInterface
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotCoreModel QUIET)

ycm_ep_helper(  XBotInterface
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY lmuratore/xbotinterface.git
                TAG master
                COMPONENT external
                DEPENDS XBotCoreModel
             )
