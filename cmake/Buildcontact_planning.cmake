# contact_planning
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(wholebody_ik QUIET)

ycm_ep_helper(  contact_planning
                TYPE GIT
                STYLE GITHUB
                REPOSITORY CentroEPiaggio/contact_planning.git
                TAG master
                COMPONENT robots
                DEPENDS drc_shared GYM idynutils wholebody_ik
            )