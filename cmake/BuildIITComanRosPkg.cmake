# IITComanRosPkg
include(YCMEPHelper)

ycm_ep_helper(IITComanRosPkg TYPE GIT
                             STYLE GITHUB
                             REPOSITORY EnricoMingo/iit-coman-ros-pkg.git
                             TAG master
                             COMPONENT robots
                             CONFIGURE_COMMAND ""
                             BUILD_COMMAND ""
                             INSTALL_COMMAND "")
