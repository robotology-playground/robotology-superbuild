# trajectory_utils
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(idynutils QUIET)

ycm_ep_helper(  trajectory_utils
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY enrico.mingo/trajectory_utils.git
                TAG master
                COMPONENT external
                DEPENDS idynutils
            )
