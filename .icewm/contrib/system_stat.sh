#!/bin/bash
# Show system status on OSD

xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 40`
head_mem='                                  used       free'
mem=`free -h | grep -i - | sed 's/-\/+ buffers\/cache:/Mem:                 /g'`
swap=`free -h | grep -i swap`
cpu_cores=`grep -c ^processor /proc/cpuinfo`
cpu=`top -bn 1 | awk 'NR>7{s+=$9} END {print "CPU: "s/'$cpu_cores}`'%'

echo -e "$head_mem\r$mem\r$swap\r$cpu" |  aosd_cat -n "Serif $font_width" -u 3000 -p 4
