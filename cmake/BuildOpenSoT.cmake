# OpenSoT
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(ICUB QUIET)
find_or_build_package(orocos_kdl QUIET)
find_or_build_package(kdl_codyco QUIET)
find_or_build_package(kdl_format_io QUIET)
find_or_build_package(iDynTree QUIET)
find_or_build_package(idynutils QUIET)
#find_or_build_package(qpOASES QUIET)

# Workaround to use qpOASES that does not have an install target or cmake config
# files.
if(TARGET qpOASES)
  ExternalProject_Get_Property(qpOASES source_dir binary_dir)
  set(qpOASES_EXTRA_CMAKE_ARGS "-DqpOASES_SOURCE_DIR=${source_dir}"
                               "-DqpOASES_BINARY_DIR=${binary_dir}")
  unset(source_dir)
  unset(binary_dir)
endif()

ycm_ep_helper(OpenSoT TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology-playground/OpenSoT.git
              TAG devel
              COMPONENT external
#              CMAKE_ARGS ${qpOASES_EXTRA_CMAKE_ARGS}
#              TEST_COMMAND ctest
              DEPENDS YARP
                      ICUB
                      orocos_kdl
                      kdl_codyco
                      kdl_format_io
                      iDynTree
                      idynutils)
#                      qpOASES)
