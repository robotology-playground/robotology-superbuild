# cogimon_simulation_tests
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(GYM QUIET)
find_or_build_package(walking QUIET)
find_or_build_package(OpenSoT QUIET)

ycm_ep_helper(  cogimon_simulation_tests
                TYPE GIT
                STYLE GITLAB_ROBOTOLOGY
                REPOSITORY cogimon/cogimon_simulation_tests.git
                TAG master
                COMPONENT cogimon
                DEPENDS GYM
			walking
			OpenSoT
			)
