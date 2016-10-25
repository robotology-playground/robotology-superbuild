# locoman_utils
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

ycm_ep_helper(locoman_utils   	TYPE GIT
                    		STYLE GITHUB
                    		REPOSITORY edoardofarnioli/locoman_utils.git
                    		TAG walkman_stable
				COMPONENT external
                    		DEPENDS YARP)
