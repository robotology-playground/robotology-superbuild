# reactive_walking
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  reactive_walking
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/reactive_walking.git
                TAG master
                COMPONENT external
                DEPENDS XBotInterface
             )
