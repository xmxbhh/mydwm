#!/bin/bash

# Load Sources.
ScriptDir=`dirname $(readlink -f $0)`
source "$ScriptDir/StatusbarInfo/NameInfo.sh"
source "$ScriptDir/StatusbarInfo/CpuInfo.sh"
source "$ScriptDir/StatusbarInfo/MemInfo.sh"
source "$ScriptDir/StatusbarInfo/NetInfo.sh"
source "$ScriptDir/StatusbarInfo/VolInfo.sh"
source "$ScriptDir/StatusbarInfo/TimeInfo.sh"



# Spawn statusbar's text every second.
# If you want to revise sleep time, cpu info and net info will be threefold.
while true
do
	CpuInfo_Get
	NetInfo_Get
	xsetroot -name "Hello `NameInfo` [`CpuInfo` `MemInfo` `NetInfo`] `VolInfo` [`TimeInfo`]"
	sleep 1s
	CpuInfo_Refresh
	NetInfo_Refresh
done
