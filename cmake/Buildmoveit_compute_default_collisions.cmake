# moveit_compute_default_collisions
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_or_build_package(moveit_setup_assistant REQUIRED QUIET)

ycm_ep_helper(moveit_compute_default_collisions 
                   TYPE GIT
                   STYLE GITHUB
                   REPOSITORY arocchi/moveit_compute_default_collisions.git
                   TAG master
                   COMPONENT external)
