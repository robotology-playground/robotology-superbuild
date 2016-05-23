# RSB-Tools-cpp
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  RSB_Tools_cpp
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.org/git/rsb.git.tools-cpp
                TAG master
                COMPONENT external
            )
