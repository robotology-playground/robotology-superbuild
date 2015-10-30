# icub_gazebo
include(YCMEPHelper)

ycm_ep_helper(  icub_gazebo
                TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology-playground/icub_gazebo.git
                TAG master
                COMPONENT robots
                CONFIGURE_COMMAND ""
                BUILD_COMMAND ""
                INSTALL_COMMAND ""
            )
