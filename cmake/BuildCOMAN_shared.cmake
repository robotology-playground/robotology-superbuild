# COMAN_shared
include(YCMEPHelper)

find_package(YamlCpp QUIET)
if(COMMAND set_package_properties)
    set_package_properties(YamlCpp PROPERTIES PURPOSE "Used by COMAN_shared")
endif()

ycm_ep_helper(  COMAN_shared
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY amargan/coman_shared.git
                TAG amargan
                COMPONENT robots
                DEPENDS YamlCpp
            )
