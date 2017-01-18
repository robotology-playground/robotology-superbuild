#cmake_minimum_required(VERSION 3.0.0)
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

# ------------------
# Compile sharedlibpp
# ------------------
find_or_build_package_with_tag(sharedlibpp OFF)

# -------------------------
# Compile RobotInterfaceROS
# -------------------------
find_or_build_package_with_tag(RobotInterfaceROS OFF)

# -------------------------
# Compile ModelInterfaceRBDL
# -------------------------
find_or_build_package_with_tag(ModelInterfaceRBDL OFF)

# ---------------------------
# Compile RobotInterfaceDUMMY
# ---------------------------
find_or_build_package_with_tag(RobotInterfaceDUMMY OFF)

# --------------------------
# Compile RobotInterfaceYARP
# --------------------------
find_or_build_package_with_tag(RobotInterfaceYARP OFF)

# ----------------------------
# Compile RobotInterfaceXBotRT
# ----------------------------
find_or_build_package_with_tag(RobotInterfaceXBotRT OFF)

# ----------------------------
# Compile XCM
# ----------------------------
find_or_build_package_with_tag(XCM OFF)

# -------------------
# Compile ADVR_shared
# -------------------
find_or_build_package_with_tag(ADVR_shared OFF)

# -------------------
# Compile advr_humanoids_common_utils
# -------------------
find_or_build_package_with_tag(advr_humanoids_common_utils OFF)

# ----------------
# Compile XBotCore
# ----------------
set(SUPERBUILD_XBotCore OFF CACHE BOOL "Flag to compile XBotCore and his dependencies: XBotCoreModel, soem_advr, walkman-master-ecat, ec_master_test")
if(SUPERBUILD_XBotCore)
find_or_build_package(XBotCore)
	find_or_build_package(XBotCoreModel)
	find_or_build_package(soem_advr)
	find_or_build_package(walkman-master-ecat)
	find_or_build_package(ec_master_test)
endif(SUPERBUILD_XBotCore)

# ------------------------
# Compile GazeboXBotPlugin
# ------------------------
find_or_build_package_with_tag(GazeboXBotPlugin OFF)

# ----------------
# Compile XBotCore-interfaces
# ----------------
find_or_build_package_with_tag(XBotCore-interfaces OFF)


# ----------------
# Compile OpenSoT
# ----------------
find_or_build_package_with_tag(OpenSoT OFF)
