# hrl_geom
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)


get_target_property(cmake_command hrl_geom _EP_CMAKE_COMMAND)
if(cmake_command)
  set(_cmake_cmd "${cmake_command}")
else()
  set(_cmake_cmd "${CMAKE_COMMAND}")
endif()

list(APPEND _cmake_cmd "@hrl_geom_CMAKE_ARGS@")

get_target_property(cmake_generator hrl_geom _EP_CMAKE_GENERATOR)
get_target_property(cmake_generator_toolset hrl_geom _EP_CMAKE_GENERATOR_TOOLSET)
if(cmake_generator)
  list(APPEND _cmake_cmd "-G${cmake_generator}")
  if(cmake_generator_toolset)
    list(APPEND _cmake_cmd "-T${cmake_generator_toolset}")
  endif()
else()
  if(CMAKE_EXTRA_GENERATOR)
    list(APPEND _cmake_cmd "-G${CMAKE_EXTRA_GENERATOR} - ${CMAKE_GENERATOR}")
  else()
    list(APPEND _cmake_cmd "-G${CMAKE_GENERATOR}")
  endif()
  if(cmake_generator_toolset)
    message(FATAL_ERROR "Option CMAKE_GENERATOR_TOOLSET not allowed without CMAKE_GENERATOR.")
  endif()
  if(CMAKE_GENERATOR_TOOLSET)
    list(APPEND _cmake_cmd "-T${CMAKE_GENERATOR_TOOLSET}")
  endif()
endif()


set(_make_hrl_geom ${_cmake_cmd})
list(APPEND _make_hrl_geom "@hrl_geom_SOURCE_DIR@/hrl_geom")

set(_copy_src ${CMAKE_COMMAND} -E copy_directory @hrl_geom_SOURCE_DIR@ src)
set(_create_catkin cd src; catkin_init_workspace)


ycm_ep_helper(hrl_geom TYPE GIT
                       STYLE GITHUB
                       REPOSITORY gt-ros-pkg/hrl-kdl.git
                       TAG hydro
                       COMPONENT external
                       CONFIGURE_COMMAND ${_make_hrl_geom})

unset(_cmake_cmd)
unset(_make_hrl_geom)
