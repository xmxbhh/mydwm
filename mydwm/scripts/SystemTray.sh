#!/bin/bash
# A system tray by "trayer".

killall trayer
if [ $? != 0 ]; then
	trayer --edge top --widthtype pixel \
	--height 20 --transparent 30 --tint 10
fi
