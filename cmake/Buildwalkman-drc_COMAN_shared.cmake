# walkman-drc_COMAN_shared
include(YCMEPHelper)

find_package(YamlCpp QUIET)
if(COMMAND set_package_properties)
    set_package_properties(YamlCpp PROPERTIES PURPOSE "Used by COMAN_shared")
endif()

ycm_ep_helper(  walkman-drc_COMAN_shared
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/coman_shared.git
                TAG emergency
                COMPONENT robots
                DEPENDS YamlCpp
            )
