#!/bin/bash
xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 40`
if [ -x "$(command -v pactl)" ];
then
	pactl set-sink-volume 0 -- "+10%"
	echo `(pactl list sinks | grep "Volume: 0:")| awk '{print $3}'`| aosd_cat -n "Serif $font_width" -f 1 -u 300 -o 1 -p 8 -x -30
else
	amixer -c 0 set Master 5%+
	echo `amixer get Master` | egrep -o "[0-9]+%" | aosd_cat -n "Serif $font_width" -f 1 -u 300 -o 1 -p 8 -x -30
fi
