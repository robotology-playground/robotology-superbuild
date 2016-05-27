# rst-converters
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  rst-converters
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.org/git/rst.git.converters.git
                TAG iit-superbuild
                COMPONENT external
                CMAKE_CACHE_ARGS -DBUILD_TESTS:BOOL=OFF
            )
