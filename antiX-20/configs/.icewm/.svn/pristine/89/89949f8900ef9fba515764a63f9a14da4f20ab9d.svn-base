#!/bin/bash
xaxis=$(xrandr --current | grep '*' | awk '{print $1}' |  cut -d 'x' -f1 | uniq)
font_width=`expr $xaxis / 40`
x_offset=`expr $xaxis / 40`
y_offset=`expr $xaxis / 40`

pactl set-sink-volume @DEFAULT_SINK@ "-5%"
echo `pactl list sinks | \
grep '^[[:space:]]Volume:' | \
head -n $(( $SINK + 1 )) | \
tail -n 1 | \
sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'` | \
osd_cat -A right -p bottom -f -adobe-helvetica-bold-r*-*-*-$font_width-120-*-*-*-*-*-*  -cgreen -d1 -i30 -o-100 -O3
