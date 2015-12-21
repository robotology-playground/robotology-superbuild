# drcsim
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  drcsim 
                TYPE HG
                STYLE BITBUCKET
                REPOSITORY osrf/drcsim
                TAG default
                COMPONENT external
            )
