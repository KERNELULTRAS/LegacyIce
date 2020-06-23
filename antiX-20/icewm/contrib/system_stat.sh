#!/bin/bash
# Show system status on OSD

xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 40`
mem_total=`free -h | awk '{print $2}' | sed -n 2p`
mem_free=`free -h | awk '{print $7}' | sed -n 2p`
mem="Mem total: $mem_total - Mem free: $mem_free"
swap_total=`free -h | awk '{print $2}' | sed -n 3p`
swap_free=`free -h | awk '{print $4}' | sed -n 3p`
swap="Swap total: $swap_total - Swap free: $swap_free"
cpu_cores=`grep -c ^processor /proc/cpuinfo`
cpu=`top -bn 1 | awk 'NR>7{s+=$9} END {print "CPU: "s/'$cpu_cores}`'%'

echo -e "$mem\n$swap\n$cpu" |  osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-* -cgreen -d3 -O3
