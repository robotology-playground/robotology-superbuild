# gazebo-pkgs
include(YCMEPHelper)

ycm_ep_helper(  gazebo-pkgs
                TYPE GIT
                STYLE GITHUB
                REPOSITORY EnricoMingo/gazebo-pkgs.git
                TAG master
                COMPONENT external
            )
