# compliance_ctrl
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)

ycm_ep_helper(  compliance_ctrl
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY http://gitlab.advrcloud.iit.it/emingo/compliance_ctrl.git
                TAG master
                COMPONENT external
                DEPENDS OROCOS-RTT
             )
