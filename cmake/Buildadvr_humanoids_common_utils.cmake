# advr_humanoids_common_utils
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(srdfdom_advr QUIET)
find_or_build_package(iDynTree QUIET)

ycm_ep_helper(  advr_humanoids_common_utils
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/advr_humanoids_common_utils.git
                TAG master
                DEPENDS srdfdom_advr
			iDynTree
                COMPONENT external
            )
