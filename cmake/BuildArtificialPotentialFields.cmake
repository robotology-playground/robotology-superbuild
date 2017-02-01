# Artificial Potential Fields
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  ArtificialPotentialFields
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/artificial-potential-fields.git
                TAG master
                COMPONENT external
		DEPENDS XCM
             )
