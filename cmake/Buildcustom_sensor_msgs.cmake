include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(custom_sensor_msgs TYPE GIT
                                 STYLE GITHUB
                                 REPOSITORY ADVRHumanoids/custom_sensor_msgs.git 
                                 TAG master
                                 COMPONENT external
	     )
