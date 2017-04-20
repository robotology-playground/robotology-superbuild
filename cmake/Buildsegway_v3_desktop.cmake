# rbdl 
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  segway_v3_desktop
                TYPE GIT
                STYLE GITHUB
                REPOSITORY StanleyInnovation/segway_v3_desktop.git
                TAG master
                COMPONENT external
            )
