# locomanipulation
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(GYM QUIET)
find_or_build_package(locoman_utils QUIET)
find_or_build_package(locoman_service_1 QUIET)
find_or_build_package(locoman_service_2 QUIET)


ycm_ep_helper(locomanipulation 	TYPE GIT
                    		STYLE GITHUB
                                REPOSITORY ADVRHumanoids/locomanipulation.git
                    		TAG new_master
				COMPONENT robots
                    		DEPENDS	GYM
					locoman_utils
					locoman_service_1
					locoman_service_2)
