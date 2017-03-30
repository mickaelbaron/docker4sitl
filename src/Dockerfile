FROM ubuntu:16.04
MAINTAINER Mickael BARON

RUN apt-get update && apt-get install -y git libtool-bin automake autoconf libexpat1-dev python-matplotlib python-serial python-wxgtk3.0 python-wxtools python-lxml python-scipy python-opencv ccache gawk git python-pip python-pexpect
RUN pip install future pymavlink MAVProxy

RUN git clone git://github.com/ArduPilot/ardupilot.git && cd ardupilot && git submodule update --init --recursive && cd / 
RUN git clone git://github.com/tridge/jsbsim.git && cd jsbsim && ./autogen.sh --enable-libraries && make

ENV PATH=$PATH:/ardupilot/Tools/autotest:/jsbsim/src:/usr/lib/ccache

EXPOSE 5762
