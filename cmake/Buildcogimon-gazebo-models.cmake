# cogimon-gazebo-models
include(YCMEPHelper)
include(FindOrBuildPackage)


ycm_ep_helper(  cogimon-gazebo-models
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/cogimon-gazebo-models.git
                TAG master
                COMPONENT robots
            )
