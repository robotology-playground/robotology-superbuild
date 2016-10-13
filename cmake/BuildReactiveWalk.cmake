# ReactiveWalk
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Eigen QUIET)



ycm_ep_helper(  ReactiveWalk
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY juan.castano/reactivewalk.git
                TAG master
                COMPONENT external
                
             )
