#!/bin/bash

# Change the network confiugration. For me it was en5 as example.
# ip=$(ifconfig|grep 'inet '|grep -v '127.0.0.1'| head -1|awk '{print $2}')
# socat TCP-LISTEN:6001,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
# SOCAT_SCID_PID=$!
# echo $SOCAT_SCID_PID

xhost +SI:localuser:root

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

docker run --rm -it --name sitl -e XAUTHORITY=/tmp/xauth -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $(pwd)/logs/$1:/ardupilot/$vehicle/statelogs/logs -v $(pwd)/build_sitl/$1:/ardupilot/build/sitl -w /ardupilot/$vehicle docker4sitl:latest sim_vehicle.py --aircraft statelogs ${@:2}

# kill $SOCAT_SCID_PID
