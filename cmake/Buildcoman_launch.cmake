# coman_launch
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  coman_launch
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/coman_launch.git
                TAG master
                COMPONENT robots
            )
