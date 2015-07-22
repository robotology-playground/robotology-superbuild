#!/bin/bash

ROBOTOLOGY_ROOT=$(dirname $(readlink --canonicalize --no-newline $0))

echo
echo "Welcome to the robotology-superbuild setup!"
echo

print_success_info() {
    echo
    echo "Run setup.sh again if you want to switch profile or bootstrap again."
    echo "Open a new terminal or run:"
    echo
    echo "source robotology-setup.bash"
    echo
    echo "to refresh the environment variables."
    echo
}

ask_for_ip() {
    while : ; do
    read -r -p "Insert ip, or blank for local (127.0.0.1) > " SELECTION
    if [ "${SELECTION:=127.0.0.1}" = "" ] ; then
        SELECTION="127.0.0.1"
    fi
    if ask "You selected [${SELECTION}]. Are you sure? [y/N] " ; then
        break
    fi
    done

    echo "$SELECTION"
}

ask() {
    read -r -p "$1" REPLY
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
            return 0;
    else
            return 1;
    fi
}

ask_robot_local_or_remote() {
    read -r -p "is the yarpserver on the [l]ocal machine or on the [r]emote (PC104)? " REPLY
    if [[ $REPLY =~ ^[Ll]$ ]]
    then
            return 0;
    else
            return 1;
    fi
}

wait_and_print() {
    echo -n "Waiting 5 seconds before executing. CTRL-C to quit "
    for i in 1 2 3 4 5
    do
       echo -n "."
       sleep 1
    done
    echo
    echo
}

setup_profile() {

    mkdir -p $ROBOTOLOGY_ROOT/build

    echo "Which kind of installation would you like to perform?"

    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" != "ROBOT" ]; then
        echo -n "*"
    else
        echo -n " "
    fi
    echo " 1   default"
    echo "     Select this option when installing the superbuild on a regular"
    echo "     laptop or desktop. You can use this installation to interface with both"
    echo "     the robot and the simulator."


    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "ROBOT" ]; then
        echo -n "*"
    else
        echo -n " "
    fi
    echo " 2   robot"
    echo "     Select this option when installing the superbuild on"
    echo "     the robot's on-board PC104. This will install the low-latency"
    echo "     linux kernel and scripts to start yarp and ros at boot,"
    echo "     but won't install gazebo."

    echo
    echo "Please input the desired number, CTRL-C to quit"
    echo
    echo -n "> "

    read i

    echo

    case $i in
        1|default|Default|DEFAULT)
            echo -n "Starting default installation... "
            wait_and_print

            $ROBOTOLOGY_ROOT/profiles/default/setup.sh

            print_success_info
            ;;
        2|robot|Robot|ROBOT)
            echo -n "Starting robot installation... "
            wait_and_print

            sudo $ROBOTOLOGY_ROOT/profiles/robot/setup.sh
            $ROBOTOLOGY_ROOT/profiles/robot/activate.sh

            print_success_info
            ;;
        "")
            echo "No selection made, bye!"
            exit 1
            ;;
        *)
            echo "Unknown selection \"$i\", bye!"
            exit 1
            ;;
    esac
}

setup_force() {

    rm -f $ROBOTOLOGY_ROOT/build/got_dependencies

    setup_profile
}

bootstrap_profile() {
    # bootstrap
    mkdir -p $ROBOTOLOGY_ROOT/build

    if [ -f $ROBOTOLOGY_ROOT/build/active_profile ]; then
      . $ROBOTOLOGY_ROOT/build/active_profile
    fi

    $ROBOTOLOGY_ROOT/scripts/bootstrap.sh

    echo "export ROBOTOLOGY_PROFILE=$ROBOTOLOGY_PROFILE" > $ROBOTOLOGY_ROOT/build/active_profile
    echo "true" > $ROBOTOLOGY_ROOT/build/got_dependencies
}

bootstrap_force() {

    # rm -rf $ROBOTOLOGY_ROOT/build

    bootstrap_profile
}

switch_profile() {
    . $ROBOTOLOGY_ROOT/robotology-setup.bash

    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "DEFAULT" ]; then
      echo -n "*"
    else
      echo -n " "
    fi
    echo -n " 1   default"
    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "DEFAULT" ]; then
        if [ -f $ROBOTOLOGY_ROOT/build/install/bin/yarp ]; then
          if [ -f `yarp conf` ] ; then
            echo "@(`cat \`yarp conf\``) - select to change remote (local/PC104)" 
          else
            echo
          fi
        else
          echo
        fi
        echo "     this is the recommended profile at the moment unless you know what you are doing."
    else
      echo
    fi


    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "ROBOT" ]; then
      echo -n "*"
    else
      echo -n " "
    fi
    echo -n " 2   robot"
    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "ROBOT" ]; then
        if [ -f $ROBOTOLOGY_ROOT/build/install/bin/yarp ]; then
          if [ -f `yarp conf` ] ; then
            echo "@(`cat \`yarp conf\``)"
          else
            echo
          fi
        else
          echo
        fi
        echo "     this is the profile to be used on the robot's PC104. If you installed a default profile on this machine"
        echo "     switching to the robot profile will automatically install all the dependencies needed for the PC104."
    else
      echo
    fi

    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "SIMULATION" ]; then
      echo -n "*"
    else
      echo -n " "
    fi
    echo -n " 3   simulation"
    if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "SIMULATION" ]; then
        if [ -f $ROBOTOLOGY_ROOT/build/install/bin/yarp ]; then
          if [ -f `yarp conf` ]; then
            echo "@(`cat \`yarp conf\``) - select to change remote (127.0.0.1/other IP)" 
          else
            echo
          fi
        else
          echo
        fi
        echo "     this is an EXPERIMENTAL profile to be used to interact with the simulator."
        echo "     It will synchronize the control loop time with the simulation loop time."
        echo "     This can lead to very slow simulations at the moment, so if your computer is fast enough"
        echo "     you should use the default profile also for simulation"
    else
      echo
    fi

    echo
    echo -n "> "

    read i

    echo

    case $i in
        1|default|Default|DEFAULT)
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "ROBOT" ]; then
              echo "Your current profile is ROBOT."
              echo "Are you sure you want to switch to DEFAULT?"
              echo "This will invoke uninstall.sh for the ROBOT profile and"
              echo "setup.sh for the DEFAULT profile. Remember to reinstall"
              echo -n "dependencies if needed. "

              if ask "Are you sure? [y/N] " ; then
                echo
                echo -n "Uninstalling ROBOT profile. "
                wait_and_print

                sudo $ROBOTOLOGY_ROOT/profiles/robot/uninstall.sh

                rm -f $ROBOTOLOGY_ROOT/build/got_dependencies

                echo -n "Installing DEFAULT profile. "
                wait_and_print

                $ROBOTOLOGY_ROOT/profiles/default/setup.sh

                print_success_info
              else
                echo "OK! bye!"
                exit 0;
              fi

            else
                echo -n "Switching profile to DEFAULT. "
                if ask_robot_local_or_remote ; then
                    echo "Selected local yarpserver .. activating"
                    wait_and_print

                    $ROBOTOLOGY_ROOT/profiles/default/activate-local.sh

                else
                    echo "Selected PC104 yarpserver .. activating"
                    wait_and_print

                    $ROBOTOLOGY_ROOT/profiles/default/activate-remote.sh

                fi
                print_success_info
            fi
            ;;
        2|robot|Robot|ROBOT)
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" != "ROBOT" ]; then
              echo "Your current profile is  different than $ROBOTOLOGY_PROFILE."
              echo "Are you sure you want to switch to ROBOT?"
              echo -n "This will invoke setup.sh for the ROBOT profile. "

              if ask "Are you sure? [y/N] " ; then
                echo
                echo -n "Installing ROBOT profile. "
                wait_and_print

                rm -f $ROBOTOLOGY_ROOT/build/got_dependencies
                sudo $ROBOTOLOGY_ROOT/profiles/robot/setup.sh
                $ROBOTOLOGY_ROOT/profiles/robot/activate.sh

                print_success_info
              else
                echo "OK! bye!"
                exit 0;
              fi

            else
                echo
            fi
            ;;
        3|simulation|Simulation|SIMULATION)
            if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" = "ROBOT" ]; then
              echo "Your current profile is ROBOT."
              echo "Are you sure you want to switch to SIMULATION?"
              echo "This will invoke uninstall.sh for the ROBOT profile and"
              echo "setup.sh for the SIMULATION profile. Remember to reinstall"
              echo -n "dependencies if needed. "

              if ask "Are you sure? [y/N] " ; then
                echo
                echo -n "Uninstalling ROBOT profile. "
                wait_and_print

                sudo $ROBOTOLOGY_ROOT/profiles/robot/uninstall.sh
                rm -f $ROBOTOLOGY_ROOT/build/got_dependencies

                echo -n "Installing Simulation profile. "
                wait_and_print

                $ROBOTOLOGY_ROOT/profiles/default/setup.sh

                print_success_info
              else
                echo "OK! bye!"
                exit 0;
              fi

            else
                echo -n "Switching profile to SIMULATION. "
                remote_ip="$(ask_for_ip)"
                echo "Selected ${remote_ip} .. activating"

                $ROBOTOLOGY_ROOT/profiles/simulation/activate-remote.sh ${remote_ip}

                print_success_info
            fi
            ;;
        "")
            echo "No selection made, bye!"
            exit 1
            ;;
        *)
            echo "Unknown selection \"$i\", bye!"
            exit 1
            ;;
    esac
}

if [ ! -f  $ROBOTOLOGY_ROOT/build/got_dependencies ]; then
    echo "It appears this is the first time you run setup.sh"
    echo "For which system would you like to perform the install steps?"
    echo "According to your choice, install (getting all dependencies and"
    echo "installing helper scripts) and bootstrap (download all modules"
    echo "and compile them) will be executed as best suited to your "
    echo "configuration of choice."
    echo 
    echo "What would you like to do?"
    echo
    echo " 1   Install superbuild (ubuntu 14.04 LTS) & bootstrap"
    echo " 2   Just bootstrap (for unsupported configurations, you need"
    echo "     to install dependencies manually, check the robotology wiki)"
    if [ "`dpkg-query -W -f='${Status}\n' gazebo-current  2> /dev/null`" = "install ok installed" ] ; then
    echo "     Notice: you have gazebo-current installed. The normal install will not"
    echo "     work if you don't remove it first. You can either manually install dependencies,"
    echo "     or try to remove it, run the install, then reinstall gazeb-current."
    fi
    echo " 3   Select Profile (defaults to DEFAULT)"
    echo "     Notice: you can do this at any time after the installation,"
    echo "     it allows you to switch to simulation mode, where the yarp modules"
    echo "     are synchronized with the gazebo clock. Also, some aliases are created"
    echo "     in order to run everything with the right configuration parameters,"
    echo "     so simple_homing and flat_walk will run automatically with the --simulation"
    echo "     switch, and by running gazebo it will automatically load the yarp clock plugin"
    echo "     needed for synchronization. Please remember that after the switch you must"
    echo "     reload your environment variables by running"
    echo "     source robotology-setup.bash"

    echo
    echo "Please input the desired number, CTRL-C to quit"
    echo
    echo -n "> "

    read i

    echo

    case $i in
        1)
            echo -n "Starting install. "
            setup_profile
            echo -n "Starting bootstrap. "
            wait_and_print
            bootstrap_profile
            ;;
        2)
            echo -n "Starting bootstrap. "
            wait_and_print
            bootstrap_profile
            ;;
        3)
            switch_profile
            ;;
        "")
            echo "No selection made, bye!"
            exit 1
            ;;
        *)
            echo "Unknown selection \"$i\", bye!"
            exit 1
            ;;
    esac

else
    echo "It appears you succesfully installed dependencies."
    echo "What would you like to do?"
    echo
    echo " 1   Reinstall dependencies"
    echo " 2   Just bootstrap (will delete the build folder)"
    echo "     This will recompile all modules and dependencies."
    echo " 3   Switch Configuration Profile"

    echo
    echo "Please input the desired number, CTRL-C to quit"
    echo
    echo -n "> "

    read i

    echo

    case $i in
        1)
            echo -n "Forcing install. "
            wait_and_print
            setup_force
            echo -n "Starting bootstrap. "
            wait_and_print
            bootstrap_profile
            ;;
        2)
            echo -n "Forcing bootstrap. "
            wait_and_print
            bootstrap_force
            ;;
        3)
            switch_profile
            ;;
        "")
            echo "No selection made, bye!"
            exit 1
            ;;
        *)
            echo "Unknown selection \"$i\", bye!"
            exit 1
            ;;
    esac
fi
