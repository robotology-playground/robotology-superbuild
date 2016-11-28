# ADVR_shared
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  ADVR_shared
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/advr_shared.git
                TAG master
                COMPONENT configs
		BUILD_COMMAND ""
		INSTALL_COMMAND ""
            )
