# walkman-master-ecat
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(soem_advr QUIET)

ycm_ep_helper(  walkman-master-ecat
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY amargan/walkman-master-ecat.git
                TAG centauro_bonn_review_2016
                COMPONENT external
		DEPENDS soem_advr
		CMAKE_CACHE_ARGS -DBUILD_SHARED_LIBS:BOOL=ON
                                 -DENABLE_XENO:BOOL=ON

             )
