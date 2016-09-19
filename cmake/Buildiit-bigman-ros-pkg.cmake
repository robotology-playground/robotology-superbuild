# iit-bigman-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  iit-bigman-ros-pkg
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/iit-bigman-ros-pkg.git
                TAG master
                COMPONENT robots
                INSTALL_COMMAND ""
            )
