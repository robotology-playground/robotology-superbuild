# MiscellaneousPlugins
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  MiscellaneousPlugins
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/MiscellaneousPlugins.git
                TAG master
                COMPONENT external
		DEPENDS XCM
             )
