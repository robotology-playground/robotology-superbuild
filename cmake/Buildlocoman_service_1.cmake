# locoman_service_1
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(GYM QUIET)
find_or_build_package(locoman_utils QUIET)

ycm_ep_helper(locoman_service_1	TYPE GIT
                    		STYLE GITHUB
                                REPOSITORY ADVRHumanoids/locoman_service_1.git
                    		TAG master
				COMPONENT robots
                    		DEPENDS	GYM
					locoman_utils)
