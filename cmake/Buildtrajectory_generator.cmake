# trajectory_generator
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(drc_shared)
find_or_build_package(GYM)

ycm_ep_helper(trajectory_generator TYPE GIT
                            STYLE GITHUB
                            REPOSITORY ADVRHumanoids/trajectory_generator.git
                            TAG master
                            COMPONENT external
                            DEPENDS drc_shared
                                    GYM
	     )
