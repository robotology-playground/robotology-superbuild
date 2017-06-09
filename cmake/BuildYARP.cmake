# YARP
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(TinyXML QUIET)
if(COMMAND set_package_properties)
    set_package_properties(TinyXML PROPERTIES PURPOSE "Used by YARP")
endif()

# For bindings
find_package(SWIG QUIET)
find_package(PythonLibs QUIET)
find_package(PythonInterp QUIET)

ycm_ep_helper(  YARP
                TYPE GIT
                STYLE GITHUB
                REPOSITORY robotology/yarp.git
                TAG master
                DEPENDS TinyXML
                CMAKE_CACHE_ARGS -DCREATE_IDLS:BOOL=ON
                                 -DCREATE_SHARED_LIBRARY:BOOL=ON
                                 -DYARP_USE_SYSTEM_SQLITE:BOOL=ON
                                 -DCREATE_LIB_MATH:BOOL=ON
                                 -DYARP_USE_ATLAS:BOOL=OFF
                                 -DCREATE_OPTIONAL_CARRIERS:BOOL=ON
                                 -DENABLE_yarpcar_bayer_carrier:BOOL=ON
                                 -DUSE_LIBDC1394:BOOL=OFF
                                 -DENABLE_yarpcar_tcpros_carrier:BOOL=ON
                                 -DENABLE_yarpcar_xmlrpc_carrier:BOOL=ON
                                 -DENABLE_yarpcar_priority_carrier:BOOL=ON
                                 -DENABLE_yarpcar_bayer_carrier:BOOL=ON
                                 -DENABLE_yarpidl_thrift:BOOL=ON
                                 -DCREATE_DEVICE_LIBRARY_MODULES:BOOL=ON
                                 -DENABLE_yarpcar_human_carrier:BOOL=ON
                                 -DENABLE_yarpcar_mjpeg_carrier:BOOL=ON
                                 -DENABLE_yarpcar_rossrv_carrier:BOOL=ON
                                 -DENABLE_yarpmod_fakebot:BOOL=ON
                                 -DENABLE_yarpmod_opencv_grabber:BOOL=OFF
                                 -DYARP_CLEAN_API:BOOL=ON
                                 -DYARP_COMPILE_TESTS:BOOL=OFF
                                 -DYARP_COMPILE_EXPERIMENTAL_WRAPPERS:BOOL=ON
                                 -DYARP_COMPILE_BINDINGS:BOOL=OFF
                                 -DCREATE_PYTHON:BOOL=ON
                                 -DCREATE_GUIS:BOOL=ON
                )
