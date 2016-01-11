#!/bin/bash
cd $ROBOTOLOGY_ROOT/external/pronto/build
cp -r bin/* $ROBOTOLOGY_ROOT/build/install/bin/
cp -r include/* $ROBOTOLOGY_ROOT/build/install/include/
cp -r lib/* $ROBOTOLOGY_ROOT/build/install/lib/
cp -r share/* $ROBOTOLOGY_ROOT/build/install/share/
# I am not going to install the config and the models folders.
