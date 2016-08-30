# vigir_generic_params
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)

ycm_ep_helper(  vigir_generic_params
                TYPE GIT
                STYLE GITHUB
                REPOSITORY team-vigir/vigir_generic_params.git
                TAG master
                COMPONENT external
            )
