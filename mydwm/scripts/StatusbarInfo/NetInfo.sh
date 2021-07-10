#!/bin/bash
# This script can compute the network usage.
# In default, you should run "NetInfo_Get" before "NetInfo" and run "NetInfo_Refresh" after "NetInfo".

function NetInfo_Get {
	NetInterface=`ip route get 8.8.8.8 | awk '{print $5}'`
	NetReceive=`cat /proc/net/dev | grep $NetInterface | awk '{print $2}'`
	NetTransmit=`cat /proc/net/dev | grep $NetInterface | awk '{print $10}'`
}



function NetInfo_Refresh {
	Old_NetReceive=$NetReceive
	Old_NetTransmit=$NetTransmit
}


#This script should be executed once per second, if not, you should change the formula.
function NetInfo_Compute {
	local Value=$1
	local Old_Value=$2
	local Difference=$((Value-Old_Value))
	if [ $Difference -lt 1048576 ]; then
		echo "`echo "$Difference" | awk '{printf"%.2f",$1/1024}'`KB/s"
	else
		echo "`echo "$Difference" | awk '{printf"%.2f",$1/1024/1024}'`MB/s"
	fi
}



# You should uncomment the top two lines of code in function if you want to use this function alone.
function NetInfo {
#	NetInfo_Refresh
#	NetInfo_Get
	echo "⬇`NetInfo_Compute $NetReceive $Old_NetReceive` ⬆`NetInfo_Compute $NetTransmit $Old_NetTransmit`"
}
