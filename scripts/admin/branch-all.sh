#!/bin/bash

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))/../..)

. $ROBOTOLOGY_ROOT/robotology-setup.bash

if [ $# -ne 1 ]; then 
    echo "Error: branch-all.sh accepts exactly one input parameter, the branch name"
    exit 1
fi

echo
echo "branch-all will create branches for all local projects with name $1"
echo
echo "All dependencies will be freezed."
echo "The robotology superbuild will be branched with name $1"
echo
echo "To use the new branch, please switch to the branch and bootstrap again by issuing"
echo "cd ${ROBOTOLOGY_ROOT}"
echo "git fetch --all"
echo "git checkout $1"
echo "scripts/bootstrap.sh"
echo
echo

cd ${ROBOTOLOGY_ROOT}
git fetch --all
echo "git status for robotology-superbuild says:"
echo
git status
echo
echo "Do you wish to continue?"
echo -n "Waiting 5 seconds before executing. CTRL-C to quit "
for i in 1 2 3 4 5
do
   echo -n "."
   sleep 1
done
echo

git branch $1
git checkout $1
echo "" > ${ROBOTOLOGY_ROOT}/cmake/ProjectsTags.cmake
cd ${ROBOTOLOGY_ROOT}/build; make update-all;

if [ -d ${ROBOTOLOGY_ROOT}/external ]; then
    for PROJ_NAME in `ls ${ROBOTOLOGY_ROOT}/external`;
    do
        if [ -d ${ROBOTOLOGY_ROOT}/external/${PROJ_NAME}/.git ]; then
            cd ${ROBOTOLOGY_ROOT}/external/$PROJ_NAME
            PROJ_TAG=`git rev-parse --short HEAD`
            echo "Updating project $PROJ_NAME with name $1 and freezing it at tag ${PROJ_TAG}"
            echo "set(${PROJ_NAME}_TAG ${PROJ_TAG})" >> ${ROBOTOLOGY_ROOT}/cmake/ProjectsTags.cmake
        else
            echo "folder $PROJ_NAME is not a git repository.. skipping"
        fi
    done
    echo >> ${ROBOTOLOGY_ROOT}/cmake/ProjectsTags.cmake
else
    echo "Error: could not find folder ${ROBOTOLOGY_ROOT}/external"
fi

if [ -d ${ROBOTOLOGY_ROOT}/modules ]; then
    for PROJ_NAME in `ls ${ROBOTOLOGY_ROOT}/modules`;
    do
        if [ -d ${ROBOTOLOGY_ROOT}/modules/${PROJ_NAME}/.git ]; then
            cd ${ROBOTOLOGY_ROOT}/modules/$PROJ_NAME
            echo -n "Updating and branching project $PROJ_NAME with name $1 ... "
            git branch $1
            git checkout $1
            git push origin $1
            echo "done"
            echo "set(${PROJ_NAME}_TAG ${1})" >> ${ROBOTOLOGY_ROOT}/cmake/ProjectsTags.cmake

        else
            echo "Error: folder $PROJ_NAME is not a git repository"
        fi
    done
else
    echo "Error: could not find folder ${ROBOTOLOGY_ROOT}/modules"
fi

echo "Printing all tags for all projects:"
echo
cat ${ROBOTOLOGY_ROOT}/cmake/ProjectsTags.cmake
echo

echo "Pushing changes to robotology branch"
cd ${ROBOTOLOGY_ROOT}
git add cmake/ProjectsTags.cmake
git commit -m "Modified cmake/ProjectsTags.cmake for branch $1"
git push origin $1