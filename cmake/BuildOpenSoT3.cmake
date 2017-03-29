# OpenSoT
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)

# Workaround to use qpOASES that does not have an install target or cmake config
# files.
if(TARGET qpOASES)
  ExternalProject_Get_Property(qpOASES source_dir binary_dir)
  set(qpOASES_EXTRA_CMAKE_ARGS "-DqpOASES_SOURCE_DIR=${source_dir}"
                               "-DqpOASES_BINARY_DIR=${binary_dir}")
  unset(source_dir)
  unset(binary_dir)
endif()

ycm_ep_helper(  OpenSoT3 TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology/OpenSoT.git
                TAG v3.0
                COMPONENT external
                DEPENDS XBotInterface
                CMAKE_CACHE_ARGS -DOPENSOT_COMPILE_TESTS:BOOL=OFF
            )
