# walkman_final_demo_field
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  walkman_final_demo_field
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/walkman_final_demo_field.git
                TAG master
                COMPONENT robots
		INSTALL_COMMAND ""
            )
