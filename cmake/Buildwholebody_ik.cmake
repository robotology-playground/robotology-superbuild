# wholebody_ik
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared QUIET)
find_or_build_package(idynutils QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(trajectory_generator QUIET)

ycm_ep_helper(  wholebody_ik 
                TYPE GIT
                STYLE GITHUB
                REPOSITORY CentroEPiaggio/wholebody_ik.git
                TAG master
                COMPONENT centroepiaggio
                DEPENDS drc_shared idynutils GYM
            )