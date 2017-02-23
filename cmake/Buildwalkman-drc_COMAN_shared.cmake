# walkman-drc_COMAN_shared
include(YCMEPHelper)

find_package(YamlCpp QUIET)
if(COMMAND set_package_properties)
    set_package_properties(YamlCpp PROPERTIES PURPOSE "Used by COMAN_shared")
endif()

ycm_ep_helper(  walkman-drc_COMAN_shared
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY walkman-drc/coman_shared.git
                TAG emergency
                COMPONENT robots
                DEPENDS YamlCpp
            )
