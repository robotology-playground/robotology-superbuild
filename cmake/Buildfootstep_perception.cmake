# footstep_perception
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)
find_package(rospy QUIET)
find_package(Boost COMPONENTS system QUIET)
find_package(Eigen QUIET)
find_or_build_package(drc_shared QUIET)
find_or_build_package(GYM QUIET)
find_or_build_package(iDynTree QUIET)

ycm_ep_helper(footstep_perception TYPE GIT
                                  STYLE GITLAB_ROBOTOLOGY
                                  REPOSITORY walkman-drc/footstep_perception.git
                                  TAG master
                                  COMPONENT robots
                                  DEPENDS YARP
                                          drc_shared
                                          GYM
					  iDynTree)
