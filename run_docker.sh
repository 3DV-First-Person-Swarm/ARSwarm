#!/bin/bash


if [ -z "$1" ]; then
  DEVICE="001"
else
  DEVICE=$1
fi

xhost +

docker run \
    --device /dev/bus/usb/001/$DEVICE \
    -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v .:/arswarm \
    arswarm:latest