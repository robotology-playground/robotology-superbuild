# chengxu_walking
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  chengxu_walking
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/chengxu_walking.git
                TAG master
                COMPONENT external
		DEPENDS XCM
             )
