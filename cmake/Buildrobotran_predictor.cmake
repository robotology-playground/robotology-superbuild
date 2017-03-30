# robotran_predictor
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(robotran_predictor  TYPE GIT
                                  STYLE GITHUB
                                  REPOSITORY ADVRHumanoids/robotran_predictor.git
                                  TAG master
                                  COMPONENT     robots
                                  DEPENDS       drc_shared
                                                idynutils
                                                GYM
                                                robotran_predictor)
