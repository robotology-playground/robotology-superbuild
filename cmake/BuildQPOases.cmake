# XBotInterface
include(YCMEPHelper)
include(FindOrBuildPackage)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fPIC")

ycm_ep_helper(  QPOases
                TYPE SVN
                STYLE qpOASES
                REPOSITORY https://projects.coin-or.org/svn/qpOASES/stable/3.2 
		TRUST_CERT 1
              #  TAG master
                COMPONENT external
                DEPENDS )



