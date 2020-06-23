#! /bin/bash
xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)
font_width=`expr $xaxis / 40`
x_offset=`expr $xaxis / 40`
y_offset=`expr $xaxis / 40`
FONT="-adobe-helvetica-bold-*-*-*-60-*-*-*-*-*-*-*"
if [ -x "$(command -v pactl)" ];
then
	pactl set-sink-volume 0 "-5%"
	pulsemixer --get-volume | cut -d' ' -f2 | osd_cat -A right -p bottom -f -adobe-helvetica-bold-r*-*-*-$font_width-120-*-*-*-*-*-*  -cgreen -d1 -i30 -o-100 -O3
else
	amixer -c 0 sset Master "5%-"
	echo `amixer get Master` | egrep -o "[0-9]+%" | sed -n 1p | osd_cat -A right -p bottom -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-*  -cgreen -d1 -i$x_offset -o-$y_offset -O3
fi
