#!/bin/bash

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))/..)

. $ROBOTOLOGY_ROOT/robotology-setup.bash

if [ $# -ne 1 ]; then 
    echo "Error: switch-all.sh accepts exactly one input parameter, the branch name"
    exit 1
fi

echo
echo "switch-all will switch branches for all local projects to branch $1"
echo
echo

cd ${ROBOTOLOGY_ROOT}
git fetch --all
git checkout -b $1 origin/$1
git checkout $1

if [ -d ${ROBOTOLOGY_ROOT}/robots ]; then
    for PROJ_NAME in `ls ${ROBOTOLOGY_ROOT}/robots`;
    do
        if [ -d ${WALKMAN_ROOT}/robots/${PROJ_NAME}/.git ]; then
            cd ${WALKMAN_ROOT}/robots/$PROJ_NAME
            echo -n "Checking out branch $1 of $PROJ_NAME ... "
	        git fetch --all
            git checkout -b $1 origin/$1
            git checkout $1
            echo "done"

        else
            echo "Error: folder $PROJ_NAME is not a git repository"
        fi
    done
else
    echo "Error: could not find folder ${WALKMAN_ROOT}/robots"
fi

cd ${WALKMAN_ROOT}
mkdir -p build
cd build
cmake ..
make update-all

