# multicontact_planning
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(GYM QUIET)

ycm_ep_helper(multicontact_planning 
                TYPE GIT
                STYLE GITHUB
                REPOSITORY CentroEPiaggio/multicontact_planning.git
                TAG master
                COMPONENT modules
                DEPENDS drc_shared idynutils GYM
)