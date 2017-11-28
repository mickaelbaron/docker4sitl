Docker4SITL aims to run SITL (Software In The Loop) of [ArduPilot](http://ardupilot.org/) with Docker. So with this solution, any operating systems which support Docker could be run SITL. 

For information, the SITL (software in the loop) simulator allows you to run Plane, Copter or Rover without any hardware for ArduPilot project. It is a build of the autopilot code using an ordinary C++ compiler, giving you a native executable that allows you to test the behaviour of the code without hardware. 

# Prerequites

* Docker
* XQuartz (server X) for Mac OS X => `brew cask install xquartz`
* socat (Multipurpose relay - SOcket CAT) for Mac OS X => `brew install socat`

# Build yourself the Docker image

* Clone the project

```bash
$ git clone https://github.com/mickaelbaron/docker4sitl.git
```

* Go to _docker4sitl_ directory and execute the following commands:

```bash
$ cd docker4sitl
$ docker build -t docker4sitl src/.
```

# Run SITL

Execute the startSITMSimulator_XXX.sh script where XXX is your operating system (only MAC_OS X is actually supported. Your contributions are welcome).

The parameters are the following
  * plane, rover and copter

  * classical options for [sim_vehicle.py](https://github.com/ArduPilot/ardupilot/blob/master/Tools/autotest/sim_vehicle.py). Note the `--aircraft` option is already used into the script with a fix value. The simulation logs will be stored into the host (see the next section).  

As example, start SITL simulator for Rover with console and map

```
$ ./startSITLSimulator_MACOSX.sh rover --console --map
```

To load a mission

```
$ wp load ../Tools/autotest/ArduPlane-Missions/CMAC-toff-loop.txt
```

Run the command “arm throttle” followed by “mode auto”

```
$ arm throttle
$ mode auto
```

# Directories during execution

When you start the script for the first time, two directories will be created on the Host

* _build_sitl_: contains the compilation result for the targeted vehicle

* _logs_: contains state and logs for each vehicle

# Contributors

* [Mickael BARON](https://www.lias-lab.fr/members/mickaelbaron)
* [Yassine OUHAMMOU](https://www.lias-lab.fr/members/yassineouhammou)


