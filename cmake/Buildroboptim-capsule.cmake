# roboptim-capsule
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)

find_or_build_package(roboptim-core-plugin-ipopt QUIET)

ycm_ep_helper(  roboptim-capsule
                TYPE GIT
                STYLE GITHUB
                REPOSITORY roboptim/roboptim-capsule.git
                TAG master
                COMPONENT external
                DEPENDS roboptim-core-plugin-ipopt
            )
