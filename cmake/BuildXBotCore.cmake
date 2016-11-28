# XBotCore
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotCoreModel QUIET)
find_or_build_package(soem_advr QUIET)
find_or_build_package(walkman-master-ecat QUIET)
find_or_build_package(ec_master_test QUIET)

ycm_ep_helper(  XBotCore
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY luca.muratore/xbotcore.git
                TAG devel
                COMPONENT external
                DEPENDS XBotCoreModel
			soem_advr
			walkman-master-ecat
			ec_master_test
            )
