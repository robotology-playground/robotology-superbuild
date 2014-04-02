#!/bin/bash


ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/../..)

mkdir -p $ROBOTOLOGY_ROOT/build
echo "export ROBOTOLOGY_PROFILE=SIMULATION" > $ROBOTOLOGY_ROOT/build/active_profile
echo "127.0.0.1 10000 yarp" > `yarp conf`
