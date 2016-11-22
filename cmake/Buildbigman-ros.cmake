# bigman-ros
include(YCMEPHelper)
include(FindOrBuildPackage)


ycm_ep_helper(  bigman-ros
                TYPE GIT
                STYLE GITLAB
                REPOSITORY xinsongyan/bigman.git
                TAG master
                COMPONENT external
             )
