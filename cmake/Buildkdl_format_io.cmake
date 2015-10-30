# kdl_format_io
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(TinyXML QUIET)
find_package(Boost COMPONENTS thread QUIET)

find_or_build_package(orocos_kdl QUIET)
find_or_build_package(kdl_codyco QUIET)
find_or_build_package(console_bridge QUIET)
find_or_build_package(urdfdom_headers QUIET)
find_or_build_package(urdfdom QUIET)

ycm_ep_helper(  kdl_format_io
                TYPE GIT
                STYLE GITHUB
                REPOSITORY traversaro/kdl_format_io.git
                TAG master
                COMPONENT external
                DEPENDS orocos_kdl
                        console_bridge
                        urdfdom_headers
                        urdfdom
                        kdl_codyco
            )
