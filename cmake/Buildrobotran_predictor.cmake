# robotran_predictor
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(robotran_predictor  TYPE GIT
                                  STYLE GITLAB_ROBOTOLOGY
                                  REPOSITORY walkman-drc/robotran_predictor.git
                                  TAG master
                                  COMPONENT     drc
                                  DEPENDS       drc_shared
                                                idynutils
                                                GYM
                                                robotran_predictor)
