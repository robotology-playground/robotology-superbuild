#!/bin/bash

actual_dir=`pwd`
# if the script is sourced add the trap
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && trap  "{ cd $actual_dir; trap - INT; return 1; }" INT

drc_dir="$ROBOTOLOGY_ROOT/robots"
external_dir="$ROBOTOLOGY_ROOT/external"

#drc dir for each
for f in `cd $drc_dir && ls -d -- */`
do
    cd "$drc_dir/$f"
    echo -e "\e[32m$f \e[39m --> `git status` \n"
    cd ..
done

#external dir for each
for f in `cd $external_dir && ls -d -- */`
do  
    cd "$external_dir/$f"
    echo -e "\e[31m$f \e[39m --> `git status` \n"
    cd ..
done

# come back to the dir where the script was executed
cd $actual_dir
# possibly remove trap
trap - INT
