cmake_minimum_required(VERSION 2.8.12)

set(YCM_GIT_GITLAB_ADVRCLOUD_BASE_ADDRESS "ssh://git@gitlab.advrcloud.iit.it/" CACHE STRING "Address to use for ADVR cloud Gitlab git repositories" FORCE)

# ---------------------
# Compile XBotInterface
# ---------------------
find_or_build_package_with_tag(XBotInterface OFF)

# ---------------------
# Compile srdfdom_advr
# ---------------------
find_or_build_package_with_tag(srdfdom_advr OFF)

# ---------------------
# Compile XBotCoreModel
# ---------------------
find_or_build_package_with_tag(XBotCoreModel OFF)

# --------------------------
# Compile centauro-simulator
# --------------------------
find_or_build_package_with_tag(centauro-simulator OFF)

# ------------------
# Compile sharedlibpp
# ------------------
find_or_build_package_with_tag(sharedlibpp OFF)

# -------------------------
# Compile RobotInterfaceROS
# -------------------------
find_or_build_package_with_tag(RobotInterfaceROS OFF)

# -------------------------
# Compile rbdl
# ------------
find_or_build_package_with_tag(rbdl OFF)

# -------------------------
# Compile ModelInterfaceRBDL
# -------------------------
find_or_build_package_with_tag(ModelInterfaceRBDL OFF)

# -------------------------
find_or_build_package_with_tag(RobotInterfaceDUMMY OFF)

# ------------
# Compile YARP
# ------------
find_or_build_package_with_tag(YARP OFF)

# --------------------------
# Compile RobotInterfaceYARP
# --------------------------
find_or_build_package_with_tag(RobotInterfaceYARP OFF)


