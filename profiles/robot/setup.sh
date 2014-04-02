#!/bin/sh


ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/../..)


# This script must be run as root
if [ `id -u` -ne 0 ]; then
    echo "You must be root to run this script."
    exit 1
fi


# Setup environment variables system wide
rm -fv /etc/profile.d/robotology.sh
echo Creating file '/etc/profile.d/robotology.sh'
cat >> /etc/profile.d/robotology.sh << EOF
export ROBOTOLOGY_PROFILE=ROBOT
if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
  if [ -f $ROBOTOLOGY_ROOT/robotology-setup.bash ]; then
    source $ROBOTOLOGY_ROOT/robotology-setup.bash
  fi
else
  export ROBOTOLOGY_ROOT=$ROBOTOLOGY_ROOT
  export PATH=$ROBOTOLOGY_ROOT/build/install/bin:$PATH
  export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib:$LD_LIBRARY_PATH
fi
EOF


# Install roscore boot script
install -v -m755 $ROBOTOLOGY_ROOT/profiles/robot/scripts/roscore /etc/init.d


# Install yarpserver bootscript
install -v -m755 $ROBOTOLOGY_ROOT/profiles/robot/scripts/yarpserver /etc/init.d
rm -fv /etc/default/yarpserver
echo Creating file '/etc/default/yarpserver'
cat >> /etc/default/yarpserver << EOF
ROBOTOLOGY_ROOT=$ROBOTOLOGY_ROOT
ROBOTOLOGY_PROFILE=ROBOT
if [ -f \$ROBOTOLOGY_ROOT/robotology-setup.bash ]; then
    . \$ROBOTOLOGY_ROOT/robotology-setup.bash
fi
DAEMON=\$ROBOTOLOGY_ROOT/build/install/bin/yarpserver
EOF


# Install yarprun boot script
install -v -m755 $ROBOTOLOGY_ROOT/profiles/robot/scripts/yarprun /etc/init.d
rm -fv /etc/default/yarprun
echo Creating file '/etc/default/yarprun'
cat >> /etc/default/yarprun << EOF
ROBOTOLOGY_ROOT=$ROBOTOLOGY_ROOT
ROBOTOLOGY_PROFILE=ROBOT
if [ -f \$ROBOTOLOGY_ROOT/robotology-setup.bash ]; then
    . \$ROBOTOLOGY_ROOT/robotology-setup.bash
fi
DAEMON=\$ROBOTOLOGY_ROOT/build/install/bin/yarprun
EOF


# Enable services at startup
update-rc.d roscore start    90 2 3 4 5 . stop 2 0 1 6 .
update-rc.d yarpserver start 60 2 3 4 5 . stop 1 0 1 6 .
update-rc.d yarprun start    90 2 3 4 5 . stop 2 0 1 6 .
