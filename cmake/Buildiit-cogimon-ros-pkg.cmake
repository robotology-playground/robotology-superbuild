# iit-cogimon-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  iit-cogimon-ros-pkg
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/iit-cogimon-ros-pkg.git
                TAG master
                COMPONENT robots
                INSTALL_COMMAND ""
            )
