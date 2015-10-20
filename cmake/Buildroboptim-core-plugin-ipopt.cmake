# simple_homing
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)

find_or_build_package(roboptim-core QUIET)

ycm_ep_helper(roboptim-core-plugin-ipopt TYPE GIT
                                         STYLE GITHUB
                                         REPOSITORY roboptim/roboptim-core-plugin-ipopt.git
                                         TAG master
                                         COMPONENT external
                                         DEPENDS roboptim-core
					 CMAKE_CACHE_ARGS -DDISABLE_TESTS:BOOL=ON)
