#!/bin/sh
if [ ! "$1" ] ; then
  echo "Change the LEDs on this video stream:"
  echo "http://lights.climagic.org/"
  echo "Usage: $0 [number]"
  exit
fi

arg="$1"
val=$((arg))
nc -w0 -u lights.climagic.com 45444 <<<$val
