# SensorsPublisher
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(custom_sensor_msgs QUIET)

ycm_ep_helper(SensorsPublisher TYPE GIT
                               STYLE GITHUB
                               REPOSITORY ADVRHumanoids/SensorsPublisher.git 
                               TAG master
                               COMPONENT external
                               DEPENDS custom_sensor_msgs
	     )
