#!/bin/bash
echo "This patch has to be applied AFTER the orocos_ws installation!"

cp AttributeBase.hpp ${ROBOTOLOGY_ROOT}/orocos_ws/install_isolated/include/rtt/base
cp PropertyBase.hpp ${ROBOTOLOGY_ROOT}/orocos_ws/install_isolated/include/rtt/base

echo "done!"
