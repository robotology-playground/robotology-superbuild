#! /bin/sh

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/../..)

mkdir -p $ROBOTOLOGY_ROOT/build
echo "export ROBOTOLOGY_PROFILE=ROBOT" > $ROBOTOLOGY_ROOT/build/active_profile
