#!/bin/bash
cd $ROBOTOLOGY_ROOT/external/pronto
git submodule update --init --recursive
make
