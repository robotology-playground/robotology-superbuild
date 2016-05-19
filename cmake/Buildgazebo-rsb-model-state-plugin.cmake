# gazebo-rsb-model-state-plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(RSC QUIET)
find_or_build_package(RSB QUIET)
find_or_build_package(RST QUIET)

ycm_ep_helper(  gazebo-rsb-model-state-plugin
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/gazebo-rsb-model-state-plugin.git
                TAG master
                COMPONENT external
                DEPENDS RSC
                        RSB
                        RST
            )
