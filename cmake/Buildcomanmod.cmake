# comanmod
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(COMAN_shared QUIET)
find_or_build_package(YARP QUIET)

ycm_ep_helper(  comanmod
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/comanmod.git
                TAG master
                COMPONENT robots
                DEPENDS COMAN_shared
                        YARP
                CMAKE_CACHE_ARGS    -DYARP_USE_GTK2:BOOL=ON
                                    -DICUB_SHARED_LIBRARY:BOOL=ON
                                    -DENABLE_comanmod_comanFTsensor:BOOL=ON
                                    -DENABLE_comanmod_comanJointTorqueSensor:BOOL=ON
                                    -DENABLE_comanmod_comanMotionControl:BOOL=ON 
                                    -DENABLE_comanmod_comanVelocityObserver:BOOL=ON
                                    -DENABLE_comanmod_imu3DM_GX3:BOOL=ON
            )
