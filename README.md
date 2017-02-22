robotology-superbuild
=====================

Robotology Superbuild

Please take a look at the [wiki](https://github.com/robotology-playground/robotology-superbuild/wiki/robotology-superbuild-handbook#installation) for installation instructions

_________________________________________________
To download and compile the WBC-TDE project
-----------------------------------
When following the installation instructions, *after cloning* the project, you can check-out this branch, install dependencies and then run the automatic bootstrap script. From the main superbuild folder, run:

```
git checkout wbc_tde
bash ./scripts/get_dependencies.sh
bash ./scripts/bootstrap.sh
```

Running the RT control plugin in simulation
-----------------------
To  run the simulation:

```
roscd centauro_gazebo/launch
roslaunch centauro_world.launch legs:=false hands:=false
```