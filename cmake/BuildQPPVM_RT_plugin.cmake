# QPPVM_RT_plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)
find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(  QPPVM_RT_plugin
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/qppvm_rt_plugin.git
                TAG master
                COMPONENT external
		DEPENDS XCM
			 OpenSoT
             )
