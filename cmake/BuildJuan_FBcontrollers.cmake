# Juan_FBcontrollers
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  Juan_FBcontrollers
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/Juan_FBcontrollers.git
                TAG master
                COMPONENT external
		DEPENDS XCM
             )
