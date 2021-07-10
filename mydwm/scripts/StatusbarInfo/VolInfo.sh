#!/bin/bash
#This function can get the Master's status and volume.

function VolInfo {
	VolumeStatus=`amixer get Master | grep "Front Left:" | awk '{print $6}' | tr -d '[]'`
	VolumeValue=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[]'`
	if [ $VolumeStatus = "on" ]; then
		echo "🔊$VolumeValue"
	else
		echo "🔇0%"
	fi
}
