# ft_publisher
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_package(catkin QUIET)
find_package(roscpp QUIET)
#find_package(Eigen QUIET)
find_or_build_package(Eigen QUIET)
find_or_build_package(GYM QUIET)

ycm_ep_helper(ft_publisher TYPE GIT
                           STYLE GITHUB
                           REPOSITORY liesrock/ft_publisher.git 
                           TAG master
                           COMPONENT robots
                           DEPENDS GYM)
