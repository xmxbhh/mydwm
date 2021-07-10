#!/bin/bash
# This function can compute the memory usage.

function MemInfo {
	MemTotal=`cat /proc/meminfo | grep "MemTotal:" | awk '{print $2}'`
	MemAvailable=`cat /proc/meminfo | grep "MemAvailable:" | awk '{print $2}'`
	echo "RAM:`echo "$MemTotal $MemAvailable" | awk '{printf"%.2f",(1-$2/$1)*100}'`%"
}
