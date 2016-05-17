# RSB Protocol
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  RSB_Protocol
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.org/git/rsb.git.protocol
                TAG master
                COMPONENT external
            )
