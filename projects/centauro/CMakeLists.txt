cmake_minimum_required(VERSION 2.8.12)

set(YCM_GIT_GITLAB_ADVRCLOUD_BASE_ADDRESS "ssh://git@gitlab.advrcloud.iit.it/" CACHE STRING "Address to use for ADVR cloud Gitlab git repositories" FORCE)


# --------------------------
# Compile centauro-simulator
# --------------------------
find_or_build_package_with_tag(centauro-simulator OFF)

# -------------------------
# Compile RobotInterfaceROS_CustomCmndInterface
# -------------------------
find_or_build_package_with_tag(RobotInterfaceROS_CustomCmndInterface OFF)

# -------------------------
# Compile CentauroUDP
# -------------------------
find_or_build_package_with_tag(CentauroUDP OFF)

# -------------------------
# Compile centauro_bonn_review_plugins
# -------------------------
find_or_build_package_with_tag(centauro_bonn_review_plugins OFF)

# -------------------------
# Compile KeyboardControl
# -------------------------
find_or_build_package_with_tag(KeyboardControl OFF)

# -------------------------
# Compile KeyboardControl
# -------------------------
find_or_build_package_with_tag(InverseKinematics OFF)

# -------------------------
# QPPVM_RT_plugin
# -------------------------
find_or_build_package_with_tag(QPPVM_RT_plugin OFF)
