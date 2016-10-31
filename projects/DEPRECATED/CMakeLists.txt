cmake_minimum_required(VERSION 2.8.12)

# --------------------------------------
# Compile centralized_inverse_kinematics
# --------------------------------------
find_or_build_package_with_tag(centralized_inverse_kinematics OFF)

# --------------------------------------
# Compile athletic - OFF by default
# --------------------------------------
find_or_build_package_with_tag(athletic OFF)

# --------------------------------------
# generic_manipulation
# --------------------------------------
find_or_build_package_with_tag(generic_manipulation OFF)

# --------------------------------------
# basic_ik
# --------------------------------------
find_or_build_package_with_tag(basic_ik OFF)

# --------------------------------------
# Compile drc_valve
# --------------------------------------
find_or_build_package_with_tag(drc_valve OFF)


