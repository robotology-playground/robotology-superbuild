# ICUB
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

ycm_ep_helper(ICUB TYPE GIT
                   STYLE GITHUB
                   REPOSITORY robotology/icub-main.git
                   DEPENDS YARP
                   CMAKE_CACHE_ARGS -DYARP_USE_GTK2:BOOL=ON
                                    -DICUB_SHARED_LIBRARY:BOOL=ON
                                    -DICUB_USE_GLUT:BOOL=ON
                                    -DENABLE_icubmod_DFKI_hand_calibrator:BOOL=OFF
                                    -DENABLE_icubmod_canBusAnalogSensor:BOOL=OFF
                                    -DENABLE_icubmod_canBusInertialMTB:BOOL=OFF
                                    -DENABLE_icubmod_canBusSkin:BOOL=OFF
                                    -DENABLE_icubmod_canBusVirtualAnalogSensor:BOOL=OFF
                                    -DENABLE_icubmod_canmotioncontrol:BOOL=OFF
                                    -DENABLE_icubmod_dragonfly2:BOOL=OFF
                                    -DENABLE_icubmod_dragonfly2raw:BOOL=OFF
                                    -DENABLE_icubmod_fakecan:BOOL=OFF
                                    -DENABLE_icubmod_analogServer:BOOL=ON
                                    -DENABLE_icubmod_cartesiancontrollerclien:BOOL=OFF
                                    -DENABLE_icubmod_cartesiancontrollerserver:BOOL=OFF
                                    -DENABLE_icubmod_debugInterfaceClient:BOOL=ON
                                    -DENABLE_icubmod_gazecontrollerclient:BOOL=ON
                                    -DENABLE_icubmod_icubarmcalibrator:BOOL=OFF
                                    -DENABLE_icubmod_icubarmcalibratorj4:BOOL=OFF
                                    -DENABLE_icubmod_icubarmcalibratorj8:BOOL=OFF
                                    -DENABLE_icubmod_icubhandcalibrator:BOOL=OFF
                                    -DENABLE_icubmod_icubheadcalibrator:BOOL=OFF
                                    -DENABLE_icubmod_icubheadcalibratorV2:BOOL=OFF
                                    -DENABLE_icubmod_icublegscalibrator:BOOL=OFF
                                    -DENABLE_icubmod_icubtalkingheadcalibrator:BOOL=OFF
                                    -DENABLE_icubmod_icubtorsoonlycalibrator:BOOL=OFF
                                    -DENABLE_icubmod_logpolarclient:BOOL=OFF
                                    -DENABLE_icubmod_logpolargrabber:BOOL=OFF
                                    -DENABLE_icubmod_sharedcan:BOOL=OFF
                                    -DENABLE_icubmod_skinWrapper:BOOL=OFF
                                    -DENABLE_icubmod_skinprototype:BOOL=OFF
                                    -DENABLE_icubmod_socketcan:BOOL=OFF
                                    -DENABLE_icubmod_static_grabber:BOOL=ON
                                    -DENABLE_icubmod_virtualAnalogServer:BOOL=ON
                                    -DENABLE_icubmod_xsensmtx:BOOL=ON
                                    -DICUB_ICUBINTERFACE_EXPERIMENTAL:BOOL=ON
                                    -DENABLE_icubmod_comanFTsensor:BOOL=OFF
                                    -DENABLE_icubmod_comanJointTorqueSensor:BOOL=OFF
                                    -DENABLE_icubmod_comanMotionControl:BOOL=OFF
                                    -DENABLE_icubmod_comanVelocityObserver:BOOL=OFF
                                    -DENABLE_icubmod_imu3DM_GX3:BOOL=ON)
