# rbdl 
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  segway_v3_robot
                TYPE GIT
                STYLE GITHUB
                REPOSITORY StanleyInnovation/segway_v3_robot.git
                TAG master
                COMPONENT external
            )
