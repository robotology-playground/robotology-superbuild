#!/bin/bash
sleep 1
sudo rmmod ftdi_sio >> /dev/null

echo imu_$1
