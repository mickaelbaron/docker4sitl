#!/bin/bash

open -a XQuartz
# Change the network confiugration. For me it was en5 as example.
ip=$(ifconfig en5 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip

case $1 in 
	plane )
		vehicle="ArduPlane";;
	copter )
		vehicle="ArduCopter";;
	rover )
		vehicle="APMrover2";;
	* )
		echo "Cannot identify the vehicle (plane, copter or rover)";
		exit 0;
esac

docker run --rm -it --name sitl --privileged -e DISPLAY=$ip:0 -v $(pwd)/logs/$1:/ardupilot/$vehicle/statelogs/logs -v $(pwd)/build_sitl/$1:/ardupilot/build/sitl -v /tmp/.X11-unix:/tmp/.X11-unix -w /ardupilot/$vehicle docker4sitl:latest sim_vehicle.py --aircraft statelogs ${@:2}
