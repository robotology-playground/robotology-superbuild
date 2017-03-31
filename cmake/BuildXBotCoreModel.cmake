# XBotCoreModel
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(srdfdom_advr QUIET)
find_or_build_package(XBotCore-interfaces QUIET)

ycm_ep_helper(  XBotCoreModel
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/xbotcoremodel.git
                TAG centauro_bonn_review_2016
                COMPONENT external
                DEPENDS srdfdom_advr
			XBotCore-interfaces
            )
