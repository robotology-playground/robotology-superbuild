# basic_ik
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(  basic_ik
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY luca.muratore/basic_ik.git
                TAG master
                COMPONENT external
                DEPENDS OpenSoT
            )
