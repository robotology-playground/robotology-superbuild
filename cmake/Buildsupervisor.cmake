# supervisor
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(GYM QUIET)
find_or_build_package(drc_shared QUIET)

ycm_ep_helper(  supervisor
                TYPE GIT
                STYLE STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/supervisor.git
                TAG master
                COMPONENT external
                DEPENDS GYM
			drc_shared
            )

