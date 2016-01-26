#!/bin/bash

# paths
TIMELIMIT="timelimit"
LIVESTREAMER="livestreamer"
FFMPEG="ffmpeg"

# parameters
IN=$1
OUT=$2
TIME=$3
if [[ -z $TIME ]]; then TIME="3600"; fi

if [ $# -lt 1 ]; then
	echo -n "Usage: $0 url output [time]"
	exit 0
fi

if [[ -z `which $TIMELIMIT` ]]; then
	echo "timelimit not found" 1>&2
	exit 1;
fi

if [[ -z `which $LIVESTREAMER` ]]; then
	echo "livestreamer not found" 1>&2
	exit 1;
fi

if [[ -z `which $FFMPEG` ]]; then
	echo "ffmpeg not found" 1>&2
	exit 1;
fi

echo "START STREAMING"
$TIMELIMIT -t $TIME $LIVESTREAMER $IN best -o $OUT.ts

echo "CONVERTING FILE TO MP3"
ffmpeg -y -i $OUT.ts -c:a libmp3lame -b:a 64k -joint_stereo 0 $OUT

rm $OUT.ts
echo "DONE"
