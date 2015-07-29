#!/bin/bash

input1=$1

actual_dir=$PWD
scripts_dir="$ROBOTOLOGY_ROOT/scripts"
GYM_scripts_dir="$ROBOTOLOGY_ROOT/external/GYM/scripts"

if [ "$input1" == "branch_list" ]; then
  . $scripts_dir/list-branch-all.sh
elif [ "$input1" == "branch_status" ]; then
  . $scripts_dir/status-all.sh
elif [ "$input1" == "branch_to_push" ]; then
  . $scripts_dir/list-to-push.sh
elif [ -z "$input1" ]; then
  echo "Usage:  superbuild <command>"
else 
  echo "Command $input1 not found!"	
fi

cd $actual_dir

