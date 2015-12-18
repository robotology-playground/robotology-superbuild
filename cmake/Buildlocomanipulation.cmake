# locomanipulation
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(GYM QUIET)
find_or_build_package(locoman_utils QUIET)

ycm_ep_helper(locomanipulation 	TYPE GIT
                    		STYLE GITLAB_ROBOTOLOGY 
                    		REPOSITORY walkman-drc/locomanipulation.git
                    		TAG new_master
				COMPONENT robots
                    		DEPENDS	GYM
					locoman_utils)
