# XBotCoreModel
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(srdfdom_advr QUIET)

ycm_ep_helper(  XBotCoreModel
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/xbotcoremodel.git
                TAG centauro_bonn_review_2016
                COMPONENT external
                DEPENDS srdfdom_advr
            )
