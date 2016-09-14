#!/bin/bash

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/..)

if [ -d $ROBOTOLOGY_ROOT/external/ ]; then
       echo "downloading transition from repo..."
       cd $ROBOTOLOGY_ROOT/external/
       git clone https://github.com/tyarkoni/transitions.git

       echo "...installing transition..."
       cd transitions/
       sudo python setup.py install
       echo "...done!"

       cd $ROBOTOLOGY_ROOT/scripts/
fi
