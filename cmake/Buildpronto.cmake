# pronto
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  pronto
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ipab-slmc/pronto-distro.git
                TAG master
                COMPONENT external
		CONFIGURE_COMMAND ""
		BUILD_COMMAND make_pronto.sh
                INSTALL_COMMAND install_pronto.sh
	    )
