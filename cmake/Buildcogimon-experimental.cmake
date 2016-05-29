# cogimon-experimental
include(YCMEPHelper)
include(FindOrBuildPackage)


ycm_ep_helper(  cogimon-experimental
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/cogimon-experimental.git
                TAG master
                COMPONENT external
                INSTALL_COMMAND ""
            )
