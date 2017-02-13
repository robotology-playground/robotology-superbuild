# WBC_TDE
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  wbc_tde
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY jlee/wbc_tde.git
                TAG master
                COMPONENT external
                DEPENDS XCM)
