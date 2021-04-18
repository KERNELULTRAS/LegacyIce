#!/bin/bash

xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 15`
y_offset=`expr $xaxis / 10`

while :
do
	# Get free mem
	free_mem=`free -k | awk '{print $7}' | sed -n 2p`
	#free_mem=`awk '/MemFree/ { printf "%.3f \n", $2 }' /proc/meminfo`;

	# Float to integer
	free_mem=`printf "%.0f\n" $free_mem`;

	# echo $free_mem | osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-*  -cgreen -o-350 -d3 &

	# If free mem is lover then 120M kill firefox
	if [ "$free_mem" -lt "120000" ];then
		pkill firefox;
		pkill chromium;
		pkill chrome;
		echo "KERNEL ULTRAS" | osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-*  -cgreen -d3 &
		echo "free memorry" | osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-*  -cgreen -d3 -o-$y_offset;
	fi
	sleep 1
done
