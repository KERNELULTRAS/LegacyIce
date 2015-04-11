#! /bin/bash
# Show system status on OSD

#free -h | grep -i - |  aosd_cat -n "Serif 40" -u 3000 -p 4
#free -h | grep -i swap |  aosd_cat -n "Serif 40" -u 3000 -p 4
#grep 'cpu ' /proc/stat | awk '{usage=int(($2+$4)*100/($2+$4+$5))} END {print "CPU " usage "%"}' |  aosd_cat -n "Serif 40" -u 4000 -p 4
# aaa=`free -h` && echo $aaa |  aosd_cat -n "Serif 40" -u 3000 -p 4
xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 40`
head_mem='                                  used       free'
mem=`free -h | grep -i - | sed 's/-\/+ buffers\/cache:/Mem:                 /g'`
swap=`free -h | grep -i swap`
cpu=`top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU: " 100 - $1"%"}'`

echo -e "$head_mem\r$mem\r$swap\r$cpu" |  aosd_cat -n "Serif $font_width" -u 3000 -p 4
