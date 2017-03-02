# FootPressureSensorPublisher
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(roscpp QUIET)

ycm_ep_helper(FootPressureSensorPublisher TYPE GIT
                           STYLE GITHUB
                           REPOSITORY ADVRHumanoids/FootPressureSensorPublisher.git 
                           TAG master
                           COMPONENT external
                           DEPENDS roscpp
			   )
