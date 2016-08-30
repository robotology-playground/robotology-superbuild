# vigir_pluginlib_manager
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(catkin QUIET)
find_package(roscpp QUIET)

find_or_build_package(vigir_pluginlib_msgs)

get_target_property(cmake_command vigir_pluginlib_manager _EP_CMAKE_COMMAND)
if(cmake_command)
 set(_cmake_cmd "${cmake_command}")
else()
 set(_cmake_cmd "${CMAKE_COMMAND}")
endif()

list(APPEND _cmake_cmd "@vigir_pluginlib_manager_CMAKE_ARGS@")

get_target_property(cmake_generator vigir_pluginlib_manager _EP_CMAKE_GENERATOR)
get_target_property(cmake_generator_toolset vigir_pluginlib_manager _EP_CMAKE_GENERATOR_TOOLSET)
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

set(_make_vigir_pluginlib_manager ${_cmake_cmd})
list(APPEND _make_vigir_pluginlib_manager "@vigir_pluginlib_manager_SOURCE_DIR@/vigir_pluginlib_manager")

ycm_ep_helper(  vigir_pluginlib_manager
                TYPE GIT
                STYLE GITHUB
                REPOSITORY team-vigir/vigir_pluginlib.git
                TAG master
                COMPONENT external
                CONFIGURE_COMMAND ${_make_vigir_pluginlib_manager}
                DEPENDS vigir_pluginlib_msgs
            )

unset(_cmake_cmd)
unset(_make_vigir_pluginlib_manager)
