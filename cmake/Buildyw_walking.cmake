# yw_walking
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  yw_walking
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/yw_walking.git
                TAG master
                COMPONENT external
		DEPENDS XCM
             )
