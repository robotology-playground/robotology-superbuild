# ec_master_test
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(soem_advr QUIET)
find_or_build_package(walkman-master-ecat QUIET)

ycm_ep_helper(  ec_master_test
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY amargan/ec_master_test.git
                TAG walkman_stable
                COMPONENT external
		DEPENDS soem_advr
			walkman-master-ecat
             )
