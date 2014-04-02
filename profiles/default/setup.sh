#!/bin/sh

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/../..)

# Activating robot profile
mkdir -p $ROBOTOLOGY_ROOT/build
echo "export ROBOTOLOGY_PROFILE=DEFAULT" > $ROBOTOLOGY_ROOT/build/active_profile

# Get dependencies
if [ -f $ROBOTOLOGY_ROOT/scripts/get_dependencies.sh ]; then
    $ROBOTOLOGY_ROOT/scripts/get_dependencies.sh
fi
