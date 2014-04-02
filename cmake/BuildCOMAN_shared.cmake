# COMAN_shared
include(YCMEPHelper)

find_package(YamlCpp)
if(COMMAND set_package_properties)
    set_package_properties(YamlCpp PROPERTIES PURPOSE "Used by COMAN_shared")
endif()

ycm_ep_helper(COMAN_shared TYPE GIT
                           STYLE GIT
                           REPOSITORY iit@90.147.26.149:/home/gituser/bare_repos/COMAN_shared.git
                           TAG testing
                           COMPONENT external
                           CMAKE_CACHE_ARGS -DCMAKE_CXX_FLAGS:STRING=-fPIC
                                            -DCOMAN_ROOT:PATH=$ENV{COMAN_ROOT})
