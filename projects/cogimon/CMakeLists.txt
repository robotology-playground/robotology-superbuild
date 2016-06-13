cmake_minimum_required(VERSION 2.8.12)

# ---------------------
# Compile cogimon model
# ---------------------
find_or_build_package_with_tag(iit-cogimon-ros-pkg OFF)

# ---------------------
# Compile cogimon_simulation_tests
# ---------------------
find_or_build_package_with_tag(cogimon_simulation_tests OFF)

# ---------------------
# Compile orocos_tutorials
# ---------------------
find_or_build_package_with_tag(orocos_tutorials OFF)

# ---------------------
# Compile rtt-gazebo-world-plugin
# ---------------------
set(SUPERBUILD_rtt_gazebo_plugins OFF CACHE BOOL "Flag to compile rtt-gazebo-plugins")
IF(SUPERBUILD_rtt_gazebo_plugins)
       find_or_build_package(RSC)
       find_or_build_package(RSB_Protocol)
       find_or_build_package(RSB)
       find_or_build_package(RSB_Tools_cpp)
       find_or_build_package(RST)
       find_or_build_package(RST_RT)
       find_or_build_package(rst-converters)
       find_or_build_package(rtt_gazebo_embedded)
       find_or_build_package(rtt-gazebo-clock-plugin)
       find_or_build_package(rtt-gazebo-lwr4plus-sim)
       find_or_build_package(cogimon-scenarios)
       find_or_build_package(rtt-rrct-typekit)
       find_or_build_package(rtt-rsb-transport)
       find_or_build_package(cogimon-experimental)
ENDIF(SUPERBUILD_rtt_gazebo_plugins)

# --------------------------------------
# Compile rtt_gazebo_robot_sim
# --------------------------------------
find_or_build_package_with_tag(rtt-gazebo-robot-sim OFF)

# --------------------------------------
# Compile rtt-core-extensions
# --------------------------------------
find_or_build_package_with_tag(rtt-core-extensions OFF)

# --------------------------------------
# Compile rtt-component-template
# --------------------------------------
find_or_build_package_with_tag(rtt-component-template OFF)


