# fcl
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  fcl
                TYPE GIT
                STYLE GITHUB
                REPOSITORY flexible-collision-library/fcl.git
                TAG master
                COMPONENT external
            )
