# advr_humanoids_common_utils
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  advr_humanoids_common_utils
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/advr_humanoids_common_utils.git
                TAG master
                COMPONENT external
            )
