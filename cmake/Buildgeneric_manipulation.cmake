# generic_manipulation
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)
find_or_build_package(GYM QUIET)

ycm_ep_helper(  generic_manipulation
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY luca.muratore/generic_manipulation.git
                TAG actions
                COMPONENT modules
                DEPENDS OpenSoT
                        GYM
              )
