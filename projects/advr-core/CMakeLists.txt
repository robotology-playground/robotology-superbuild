cmake_minimum_required(VERSION 3.0.0)

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

# -------------------------
# Compile ModelInterfaceDUMMY
# -------------------------
find_or_build_package_with_tag(RobotInterfaceDUMMY OFF)

# --------------------------
# Compile RobotInterfaceYARP
# --------------------------
find_or_build_package_with_tag(RobotInterfaceYARP OFF)

# -------------------
# Compile ADVR_shared
# -------------------
find_or_build_package_with_tag(ADVR_shared OFF)

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
