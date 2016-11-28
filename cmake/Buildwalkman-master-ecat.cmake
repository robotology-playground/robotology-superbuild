# walkman-master-ecat
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(soem_advr QUIET)

ycm_ep_helper(  walkman-master-ecat
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY amargan/walkman-master-ecat.git
                TAG walkman_stable
                COMPONENT external
		DEPENDS soem_advr
             )
