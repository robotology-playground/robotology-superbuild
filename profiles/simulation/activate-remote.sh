#!/bin/bash


ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/../..)

mkdir -p $ROBOTOLOGY_ROOT/build
echo "export ROBOTOLOGY_PROFILE=SIMULATION" > $ROBOTOLOGY_ROOT/build/active_profile
echo "Configuring YARP for use with remote yarpserver."
echo " Remember you need to use 169.254.89.x as local IP address"
echo " with x < 20 and x != 10"
if [ $# -eq 0 ]; then
    echo "169.254.89.10 10000 yarp" > `yarp conf`
else
    echo "$1 10000 yarp" > `yarp conf`
fi
