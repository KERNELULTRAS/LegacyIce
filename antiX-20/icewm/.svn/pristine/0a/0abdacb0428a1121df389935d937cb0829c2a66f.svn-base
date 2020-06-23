#!/bin/bash
# Show system status on OSD

xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 40`
head_mem='                                     used       free'
# mem=`free -h | grep -i - | sed 's/-\/+ buffers\/cache:/Mem:/g'`
mem=`free -h | grep -i buffers/cache`
swap=`free -h | grep -i swap`
cpu_cores=`grep -c ^processor /proc/cpuinfo`
cpu=`top -bn 1 | awk 'NR>7{s+=$9} END {print "CPU: "s/'$cpu_cores}`'%'

echo -e "$head_mem\n$mem\n$swap\n$cpu" |  osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-* -cgreen -d3 -O3
