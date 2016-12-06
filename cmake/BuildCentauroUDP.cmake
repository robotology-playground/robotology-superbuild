# centauro-udp
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  CentauroUDP
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY centauro-simulator-control/centauro-udp.git
                TAG master
                COMPONENT external
             )
