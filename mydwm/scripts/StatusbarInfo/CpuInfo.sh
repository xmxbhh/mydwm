#!/bin/bash
# This script can compute the cpu usage.
# In default, you should run "CpuInfo_Get" before "CpuInfo" and run "CpuInfo_Refresh" after "CpuInfo".

# Get cpu status, from $2 to $8 are user,nice,system,idle,iowait,irq,softirq.
# Cpu time = user+nice+system+idle+iowait+irq+softirq.
function CpuInfo_Get {
	CpuLog=`cat /proc/stat | grep "cpu " | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}'`
	CpuIDLE=`echo "$CpuLog" | awk '{print $4}'`
	CpuTotal=`echo "$CpuLog" | awk '{print $1+$2+$3+$4+$5+$6+$7}'`
}



function CpuInfo_Refresh {
	Old_CpuLog=$CpuLog
	Old_CpuIDLE=$CpuIDLE
	Old_CpuTotal=$CpuTotal
}



# Cpu time slice = new cpu time - old cpu time
# Idle time slice = new idle time - old idle time
# Cpu total usage = (cpu time slice - idle time slice) / cpu time slice * 100
function CpuInfo_Compute {
	local DifferenceIDLE=$((CpuIDLE-Old_CpuIDLE))
	local DifferenceTotal=$((CpuTotal-Old_CpuTotal))
	echo "CPU:`echo "$DifferenceIDLE $DifferenceTotal" | awk '{printf"%.2f",($2-$1)/$2*100}'`%"
}



# You should uncomment the top two lines of code in function if you want to use this function alone.
function CpuInfo {
#	CpuInfo_Refresh
#	CpuInfo_Get
	echo "`CpuInfo_Compute`"
}
