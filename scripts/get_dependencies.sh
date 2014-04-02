#!/bin/bash

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/..)

if [ -f $ROBOTOLOGY_ROOT/build/active_profile ]; then
    . $ROBOTOLOGY_ROOT/build/active_profile
fi

if [ -f ${ROBOTOLOGY_ROOT}/build/got_dependencies ]; then
  echo "ROBOTOLOGY dependencies already installed. Skipping..."
  echo "If you really want to repeat an installation, you can"
  echo "remove $ROBOTOLOGY_ROOT/build/got_dependencies"
else

   if [ "`lsb_release -is`" = 'Ubuntu' ]; then
      sudo apt-add-repository ppa:robotology/ppa -y
      sudo sh -c 'echo "deb http://www.icub.org/ubuntu `lsb_release -cs` contrib/science" > /etc/apt/sources.list.d/icub.list'
      sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'
      wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
      sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
      wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

      echo "-- Removing ros-groovy-*"
      sudo apt-get remove ros-groovy-*

      sudo apt-get update

      sudo apt-get dist-upgrade -y --force-yes

      if [ "`lsb_release -cs`" = 'precise' ]; then
         string="`uname -r`"
         word="enomai"
         if [ "${string#*$word}" != "$string" ]; then
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = 'ROBOT' ]; then
               sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                    git subversion `# VCS` \
                                    doxygen graphviz `# documentation tools` \
                                    libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev python3.2-dev swig `# YARP dependencies` \
                                    icub-common `# iCub dependencies` \
                                    libeigen3-dev `# CoDyCo dependencies` \
                                    libxml2-dev `# ComanSimulator dependencies` \
                                    ros-hydro-desktop-full ros-hydro-roscpp-core ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                    ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                    ros-hydro-joy* `# Joystick ROS Driver` \
                                    python3-sip-dev `# rviz` \
                                    libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                    libpng++-dev `# Planner dependencies` \
                                    python-bs4 `# IITComanRosPkg`

            fi
         else
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = 'ROBOT' ]; then
               sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                    git subversion `# VCS` \
                                    linux-lowlatency `# low latency kernel` \
                                    doxygen graphviz `# documentation tools` \
                                    libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev python3.2-dev swig `# YARP dependencies` \
                                    icub-common `# iCub dependencies` \
                                    libeigen3-dev `# CoDyCo dependencies` \
                                    libxml2-dev `# ComanSimulator dependencies` \
                                    ros-hydro-desktop-full ros-hydro-roscpp-core ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                    ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                    ros-hydro-joy* `# Joystick ROS Driver` \
                                    python3-sip-dev `# rviz` \
                                    libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                    libpng++-dev `# Planner dependencies` \
                                    python-bs4 `# IITComanRosPkg`

            fi
         fi


         if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" != 'ROBOT' ]; then
            sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                 git subversion `# VCS` \
                                 doxygen graphviz `# documentation tools` \
                                 libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev python3.2-dev swig `# YARP dependencies` \
                                 icub-common `# iCub dependencies` \
                                 libeigen3-dev `# CoDyCo dependencies` \
                                 gazebo `# gazebo-yarp-plugins dependencies` \
                                 libxml2-dev `# ComanSimulator dependencies` \
                                 ros-hydro-desktop-full ros-hydro-roscpp-core ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                 ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                 ros-hydro-joy* `# Joystick ROS Driver` \
                                 python3-sip-dev `# rviz` \
                                 libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                 libpng++-dev `# Planner dependencies` \
                                 python-bs4 `# IITComanRosPkg`
        fi

        git config --global http.sslverify false

         echo "Installing yaml-cpp from sources..."
         mkdir -p $ROBOTOLOGY_ROOT/tmp
         cd $ROBOTOLOGY_ROOT/tmp
         wget https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz
         tar xzf yaml-cpp-0.5.1.tar.gz
         mkdir $ROBOTOLOGY_ROOT/tmp/yaml-cpp-0.5.1/build
         cd $ROBOTOLOGY_ROOT/tmp/yaml-cpp-0.5.1/build
         cmake .. -DBUILD_SHARED_LIBS=ON; make -j3; make; 
         sudo make install;
         cd $ROBOTOLOGY_ROOT;
         sudo rm -rf $ROBOTOLOGY_ROOT/tmp
         echo "...done!"

      fi

      if [ "`lsb_release -cs`" = 'raring' ]; then
         string="`uname -r`"
         word="enomai"
         if [ "${string#*$word}" != "$string" ]; then
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = 'ROBOT' ]; then
               sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                    git subversion `# VCS` \
                                    doxygen graphviz `# documentation tools` \
                                    ca-certificates-icub-org `# SSL Certificates for icub.org websites` \
                                    libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev swig `# YARP dependencies` \
                                    icub-common `# iCub dependencies` \
                                    libeigen3-dev `# CoDyCo dependencies` \
                                    libyaml-cpp-dev `# COMAN_shared dependencies` \
                                    libxml2-dev `# ComanSimulator dependencies` \
                                    ros-hydro-desktop-full ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                    ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                    ros-hydro-joy* `# Joystick ROS Driver` \
                                    python3-sip-dev `# rviz` \
                                    libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                    libpng++-dev `# Planner dependencies` \
                                    python-bs4 `# IITComanRosPkg`

            fi
         else
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = 'ROBOT' ]; then
               sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                    git subversion `# VCS` \
                                    linux-lowlatency `# low latency kernel` \
                                    doxygen graphviz `# documentation tools` \
                                    ca-certificates-icub-org `# SSL Certificates for icub.org websites` \
                                    libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev swig `# YARP dependencies` \
                                    icub-common `# iCub dependencies` \
                                    libeigen3-dev `# CoDyCo dependencies` \
                                    libyaml-cpp-dev `# COMAN_shared dependencies` \
                                    libxml2-dev `# ComanSimulator dependencies` \
                                    ros-hydro-desktop-full ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                    ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                    ros-hydro-joy* `# Joystick ROS Driver` \
                                    python3-sip-dev `# rviz` \
                                    libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                    libpng++-dev `# Planner dependencies` \
                                    python-bs4 `# IITComanRosPkg`

            fi
         fi

        if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" != 'ROBOT' ]; then
            sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                 git subversion `# VCS` \
                                 doxygen graphviz `# documentation tools` \
                                 ca-certificates-icub-org `# SSL Certificates for icub.org websites` \
                                 libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev swig `# YARP dependencies` \
                                 icub-common `# iCub dependencies` \
                                 libeigen3-dev `# CoDyCo dependencies` \
                                 libyaml-cpp-dev `# COMAN_shared dependencies` \
                                 gazebo `# gazebo-yarp-plugins dependencies` \
                                 libxml2-dev `# ComanSimulator dependencies` \
                                 ros-hydro-desktop-full ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                 ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                 ros-hydro-joy* `# Joystick ROS Driver` \
                                 python3-sip-dev `# rviz` \
                                 libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                 libpng++-dev `# Planner dependencies` \
                                 python-bs4 `# IITComanRosPkg`
        fi
      fi

      if [ "`lsb_release -cs`" != 'raring' ] && [ "`lsb_release -cs`" != 'precise' ]; then

         echo
         echo "`lsb_release -cs` is not supported at the moment. We will try installing dependencies anyway"
         echo "Please report on the results!"
         echo

         string="`uname -r`"
         word="enomai"
         if [ "${string#*$word}" != "$string" ]; then
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = 'ROBOT' ]; then
               sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                    git subversion `# VCS` \
                                    doxygen graphviz `# documentation tools` \
                                    ca-certificates-icub-org `# SSL Certificates for icub.org websites` \
                                    libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev swig `# YARP dependencies` \
                                    icub-common `# iCub dependencies` \
                                    libeigen3-dev `# CoDyCo dependencies` \
                                    libyaml-cpp-dev `# COMAN_shared dependencies` \
                                    libxml2-dev `# ComanSimulator dependencies` \
                                    ros-hydro-desktop-full ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                    ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                    ros-hydro-joy* `# Joystick ROS Driver` \
                                    python3-sip-dev `# rviz` \
                                    libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                    libpng++-dev `# Planner dependencies` \
                                    python-bs4 `# IITComanRosPkg`

            fi
         else
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = 'ROBOT' ]; then
               sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                    git subversion `# VCS` \
                                    linux-lowlatency `# low latency kernel` \
                                    doxygen graphviz `# documentation tools` \
                                    ca-certificates-icub-org `# SSL Certificates for icub.org websites` \
                                    libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev swig `# YARP dependencies` \
                                    icub-common `# iCub dependencies` \
                                    libeigen3-dev `# CoDyCo dependencies` \
                                    libyaml-cpp-dev `# COMAN_shared dependencies` \
                                    libxml2-dev `# ComanSimulator dependencies` \
                                    ros-hydro-desktop-full ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                    ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                    ros-hydro-joy* `# Joystick ROS Driver` \
                                    python3-sip-dev `# rviz` \
                                    libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                    libpng++-dev `# Planner dependencies` \
                                    python-bs4 `# IITComanRosPkg`

            fi
         fi

        if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" != 'ROBOT' ]; then
            sudo apt-get install -y --force-yes build-essential cmake cmake-curses-gui `# compilers and build tools` \
                                 git subversion `# VCS` \
                                 doxygen graphviz `# documentation tools` \
                                 ca-certificates-icub-org `# SSL Certificates for icub.org websites` \
                                 libace-dev libgsl0-dev libgtkmm-2.4-dev libgoocanvasmm-dev libsqlite3-dev swig `# YARP dependencies` \
                                 icub-common `# iCub dependencies` \
                                 libeigen3-dev `# CoDyCo dependencies` \
                                 libyaml-cpp-dev `# COMAN_shared dependencies` \
                                 gazebo `# gazebo-yarp-plugins dependencies` \
                                 libxml2-dev `# ComanSimulator dependencies` \
                                 ros-hydro-desktop-full ros-hydro-srdfdom ros-hydro-cmake-modules `# ROS` \
                                 ros-hydro-openni2-* `# 3D Camera ROS Driver` \
                                 ros-hydro-joy* `# Joystick ROS Driver` \
                                 python3-sip-dev `# rviz` \
                                 libarmadillo-dev libblas-dev liblapack-dev `# Valve dependencies` \
                                 libpng++-dev `# Planner dependencies` \
                                 python-bs4 `# IITComanRosPkg`
        fi
      fi

   else
      echo "You are not running Ubuntu."
      echo "Please install the dependencies manually."
   fi

# TODO this is a [quickfix]
echo "Adding robotology-setup.sh to your .bashrc"

echo ">>> Press ENTER if you want to skip writing to .bashrc. "
echo "    You should not skip it unless you know what you are doing."
if read -t 10 -p '    I will wait for 10 seconds <<< ' ; then
   echo "... skipping"
else
   echo ". $ROBOTOLOGY_ROOT/robotology-setup.bash" >> ~/.bashrc
fi

. $ROBOTOLOGY_ROOT/robotology-setup.bash

# A fresh installaion of ROS would require the following two commands
# NOT TESTED, please verify!
sudo rosdep init
rosdep update

echo "Installing rviz from sources..."
mkdir -p $ROBOTOLOGY_ROOT/tmp
cd $ROBOTOLOGY_ROOT/tmp
git clone git@github.com:MirkoFerrati/rviz.git
git checkout hydro-devel
mkdir $ROBOTOLOGY_ROOT/tmp/rviz/build
cd $ROBOTOLOGY_ROOT/tmp/rviz/build
cmake .. -DCMAKE_PREFIX_PATH=/opt/ros/hydro; make -j3; make; sudo make install;
cd $ROBOTOLOGY_ROOT;
sudo rm -rf $ROBOTOLOGY_ROOT/tmp
echo "...done!"

if [ -d $ROBOTOLOGY_ROOT/build/ ]; then
    echo "true" > $ROBOTOLOGY_ROOT/build/got_dependencies
else
    echo "You can now run bootstrap.sh to fetch all packages"
fi

sudo ldconfig

fi
