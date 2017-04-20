# rbdl 
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  segway_v3_simulator
                TYPE GIT
                STYLE GITHUB
                REPOSITORY StanleyInnovation/segway_v3_simulator.git
                TAG master
                COMPONENT external
            )
