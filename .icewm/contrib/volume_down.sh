#! /bin/bash

pactl set-sink-volume 0 -- "-10%"
echo `(pactl list sinks | grep "Volume: 0:")| awk '{print $3}'`| aosd_cat -n "Serif 40" -f 1 -u 300 -o 1 -p 8 -x -30
