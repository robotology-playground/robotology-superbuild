# RST-RT
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  RST_RT
                TYPE GIT
                STYLE GITHUB 
                REPOSITORY corlab/rst-rt.git
                TAG master
                COMPONENT external
            )
