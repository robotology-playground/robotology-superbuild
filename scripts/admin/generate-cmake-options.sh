### parameters are 
# $1: hostname (could be also buildtype)
# $2: os type (macos, winxp, lenny, etch, karmic ...)
# $3: test type: nightly continuous experimental

CMAKE_OPTIONS="\
-DNON_INTERACTIVE_BUILD:BOOL=TRUE \
-DBUILD_TESTING:BOOL=TRUE \
"
