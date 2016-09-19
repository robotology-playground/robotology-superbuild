# iit-cogimon-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  iit-cogimon-ros-pkg
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY cogimon/iit-cogimon-ros-pkg.git
                TAG master
                COMPONENT robots
                INSTALL_COMMAND ""
            )
