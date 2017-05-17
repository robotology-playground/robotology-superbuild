# cogimon_simulation_tests
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(GYM QUIET)
find_or_build_package(walking QUIET)
find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(  cogimon_simulation_tests
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/cogimon_simulation_tests.git
                TAG master
                COMPONENT robots
                DEPENDS GYM
			walking
			OpenSoT
			)
