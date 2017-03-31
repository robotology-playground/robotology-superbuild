# robotran_predictor_ctrl_test
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(robotran_predictor_ctrl_test  TYPE GIT
                                            STYLE GITHUB
                                            REPOSITORY ADVRHumanoids/robotran_predictor_ctrl_test.git
                                            TAG master
                                            COMPONENT robots
                                            DEPENDS robotran_predictor)
