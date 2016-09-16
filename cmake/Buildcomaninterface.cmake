# comaninterface
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(comanmod QUIET)
find_or_build_package(comanapp QUIET)

ycm_ep_helper(  comaninterface
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/comaninterface.git
                TAG master
                COMPONENT drc
                DEPENDS comanmod
                        comanapp
            )
