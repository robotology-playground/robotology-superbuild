# ReactiveWalk
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)



ycm_ep_helper(  ReactiveWalk
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/reactivewalk.git
                TAG master
                COMPONENT external
                
             )
