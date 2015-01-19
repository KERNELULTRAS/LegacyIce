#! /bin/bash
# Show system status on OSD

free -h | grep -i - |  aosd_cat -n "Serif 40" -u 3000 -p 4
free -h | grep -i swap |  aosd_cat -n "Serif 40" -u 3000 -p 4
grep 'cpu ' /proc/stat | awk '{usage=int(($2+$4)*100/($2+$4+$5))} END {print "CPU " usage "%"}' |  aosd_cat -n "Serif 40" -u 4000 -p 4
