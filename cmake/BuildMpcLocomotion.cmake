# XBotInterface
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(QPBuilder QUIET)
find_or_build_package(XBotInterface QUIET)


ycm_ep_helper(  MpcLocomotion
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY alaurenzi/mpc_locomotion.git
                TAG master
                COMPONENT external
                DEPENDS QPBuilder
			XBotInterface
             )
