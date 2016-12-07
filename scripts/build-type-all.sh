#!/bin/bash

actual_dir=`pwd`
# if the script is sourced add the trap
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && trap  "{ cd $actual_dir; trap - INT; return 1; }" INT

robots_dir="$ROBOTOLOGY_ROOT/build/robots"
external_dir="$ROBOTOLOGY_ROOT/build/external"

#robots dir for each
for f in `cd $robots_dir && ls -d -- */`
do
    cd "$robots_dir/$f"
    echo -e "\e[32m$f \e[39m --> `grep CMAKE_BUILD_TYPE:STRING CMakeCache.txt` \n"
    cd ..
done

#external dir for each
for f in `cd $external_dir && ls -d -- */`
do  
    cd "$external_dir/$f"
    echo -e "\e[31m$f \e[39m --> `grep CMAKE_BUILD_TYPE:STRING CMakeCache.txt` \n"
    cd ..
done

# come back to the dir where the script was executed
cd $actual_dir
# possibly remove trap
trap - INT
