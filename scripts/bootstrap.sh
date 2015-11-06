#!/bin/bash

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))/..)

. $ROBOTOLOGY_ROOT/robotology-setup.bash

cd $ROBOTOLOGY_ROOT
git fetch --all || exit 1
git pull
echo "git status for walkman says:"
echo
git status
echo
echo "Do you wish to continue? If you are up-to-date everything should be fine."
echo "If you are not, please consider switching to the latest master branch by running a "
echo "git reset --hard origin/master"
echo -n "Waiting 10 seconds before executing. CTRL-C to quit "
for i in 1 2 3 4 5 6 7 8 9 10
do
   echo -n "."
   sleep 1
done
if [ -d $ROBOTOLOGY_ROOT/build ]; then
    echo "A build folder already exists"
    echo "Bootstrapping will delete it."

    echo "Running make status-all for check for project status. Please commit any important change before bootstrapping"
    echo
    cd $ROBOTOLOGY_ROOT/build
    make status-all
    echo
    echo "Do you wish to continue? If you are up-to-date everything should be fine."
    echo -n "Press ENTER to continue > "

    read i

    echo

    case $i in
        "")
            echo
            ;;
        *)
            echo "Unknown selection \"$i\", bye!"
            exit 1
            ;;
    esac

    cd $ROBOTOLOGY_ROOT
  
    if [ -f active_profile ]; then
	cp active_profile /tmp/
    fi
  
    rm -rf $ROBOTOLOGY_ROOT/build
fi

mkdir -p $ROBOTOLOGY_ROOT/build

if [ -f /tmp/active_profile ]; then
    cp /tmp/active_profile $ROBOTOLOGY_ROOT/build/
fi

cd $ROBOTOLOGY_ROOT/build
cmake .. -DYCM_EP_MAINTAINER_MODE=ON
make update-all 
make -ik; make;

. $ROBOTOLOGY_ROOT/robotology-setup.bash

rospack profile

echo
echo
echo
echo "----------------------------------------------------"
echo "Bootstrap finished. Next time you want to update all"
echo "just run, from inside the build folder:"
echo
echo "make update-all; make"
echo
echo "or, if you just want to compile without downloading new updates"
echo
echo "make"
echo
echo "Please remember to commit the local changes you might have"
echo "added to the local projects before updating all."
echo "You can check any modifications you might have done by running"
echo
echo "make status-all"
echo
echo "If  you want just to test changes to your local project,"
echo "we recommend to run the build process from inside the build folder"
echo "that is, e.g. for simple_homing, once inside your walkman folder"
echo
echo "cd build/drc/simple_homing; make; make install"
echo
echo "More easily, if you use QtCreator to build your project, remember"
echo "to set the previous folder (e.g. build/drc/simple_homing) for compilation."
echo "It will not run a make install, but this is the preferred quick way"
echo "to test your module."
echo
echo "Remember also you can run executables from any location in your pc,"
echo "but you should be aware that the configuration files"
echo "loaded by the application are different."
echo "If you need to change the application configuration, it is advised"
echo "to do so locally."
echo
echo
echo
