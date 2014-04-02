#!/bin/sh

# This script must be run as root
if [ `id -u` -ne 0 ]; then
    echo "You must be root to run this script."
    exit 1
fi

rm -fv /etc/profile.d/robotology.sh
rm -fv /etc/init.d/roscore
rm -fv /etc/init.d/yarpserver
rm -fv /etc/init.d/yarprun
rm -fv /etc/default/yarprun
rm -fv /etc/default/yarpserver
rm -Rfv /etc/yarp

update-rc.d yarprun remove
update-rc.d yarpserver remove
update-rc.d roscore remove
