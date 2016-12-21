# KeyboardControl
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  KeyboardControl
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
		REPOSITORY centauro-simulator-control/keyboardcontrol.git
                TAG master
                COMPONENT external
             )
