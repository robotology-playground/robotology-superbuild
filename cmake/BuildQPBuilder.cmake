# QPBuilder 
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(QPOases QUIET)
find_or_build_package(XBotInterface QUIET)


ycm_ep_helper(  QPBuilder
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY alaurenzi/qpbuilder.git
                TAG master
                COMPONENT external
		DEPENDS QPOases XBotInterface
             )
