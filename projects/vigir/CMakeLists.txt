cmake_minimum_required(VERSION 2.8.12)
# --------------------------------------
# Compile vigir_generic_params - OFF by default
# --------------------------------------
find_or_build_package_with_tag(vigir_generic_params OFF)

# --------------------------------------
# Compile vigir_pluginlib - OFF by default
# --------------------------------------
find_or_build_package_with_tag(vigir_pluginlib OFF)

# --------------------------------------
# Compile vigir_footstep_planning_msgs - OFF by default
# --------------------------------------
find_or_build_package_with_tag(vigir_footstep_planning_msgs OFF)

# --------------------------------------
# Compile vigir_footstep_planning_core - OFF by default
# --------------------------------------
find_or_build_package_with_tag(vigir_footstep_planning_core OFF)

# --------------------------------------
# Compile vigir_footstep_planning_basics - OFF by default
# --------------------------------------
find_or_build_package_with_tag(vigir_footstep_planning_basics OFF)

# --------------------------------------
# Compile vigir_terrain_classifier - OFF by default
# --------------------------------------
find_or_build_package_with_tag(vigir_terrain_classifier OFF)
