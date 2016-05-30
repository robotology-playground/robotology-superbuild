cmake_minimum_required(VERSION 2.8.12)

# ------------------------------------
# Superbuild CORE - compile it always.
# ------------------------------------
find_or_build_package(YARP)
find_or_build_package(iDynTree)
find_or_build_package(idynutils)
find_or_build_package(OpenSoT)
find_or_build_package(GYM)
find_or_build_package(paramHelp)
find_or_build_package(GazeboYARPPlugins)

#------
# Model
#------
# Compile COMAN model
find_or_build_package_with_tag(IITComanRosPkg ON)
# Compile iCub model
find_or_build_package_with_tag(icub_gazebo ON)

# -------------------------------------------
# Compile CAPSULE for the collision avoidance
# -------------------------------------------
set(SUPERBUILD_CAPSULE ON CACHE BOOL "Flag to compile roboptim-core, moveit_compute_default_collisions, roboptim-capsule, roboptim-core-plugin-ipopt, robot_capsule_generator")
IF(SUPERBUILD_CAPSULE)
	find_or_build_package(roboptim-core)
	find_or_build_package(moveit_compute_default_collisions)
	find_or_build_package(roboptim-capsule)
	find_or_build_package(roboptim-core-plugin-ipopt)
	find_or_build_package(robot_capsule_generator)
ENDIF(SUPERBUILD_CAPSULE)

# --------------------------------------
# Compile yarp_ros_joint_state_publisher
# --------------------------------------
find_or_build_package_with_tag(yarp_ros_joint_state_publisher ON)

# --------------------------------------
# Compile robot_state_publisher_ext
# --------------------------------------
find_or_build_package_with_tag(robot_state_publisher_ext ON)

