#!/bin/bash
#This function can get the date and time with "yyyy-mm-dd Sun..Sat hh:mm"

function TimeInfo {
	echo "$(date +"%F %a %R")"
}
