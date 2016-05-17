# robotran_predictor_ctrl_test
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(robotran_predictor_ctrl_test  TYPE GIT
                                            STYLE GITLAB_ROBOTOLOGY
                                            REPOSITORY walkman-drc/robotran_predictor_ctrl_test.git
                                            TAG master
                                            COMPONENT drc
                                            DEPENDS robotran_predictor)
