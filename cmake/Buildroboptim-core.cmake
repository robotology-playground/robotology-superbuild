# roboptim-core
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)

ycm_ep_helper(  roboptim-core
                TYPE GIT
                STYLE GITHUB
                REPOSITORY roboptim/roboptim-core.git
                TAG master
                COMPONENT external
            )
