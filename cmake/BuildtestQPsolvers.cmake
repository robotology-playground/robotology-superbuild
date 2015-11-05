# testQPsolvers
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(testQPsolvers TYPE GIT
                             STYLE GITHUB
                             REPOSITORY EnricoMingo/testQPsolvers.git
                             TAG master
                             COMPONENT robots
                             DEPENDS OpenSoT
                             INSTALL_COMMAND "")
