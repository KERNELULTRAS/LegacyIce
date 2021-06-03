#!/bin/bash

```
Auto make jump window under mouse
Change MIN_Y to width by panel
```

xaxis=$(xrandr --current | grep '*' | awk '{print $1}' |  cut -d 'x' -f1 | uniq)
font_width=`expr $xaxis / 40`

FILE="$HOME/.icewm/contrib/jumping_id.txt"

if test -f "$FILE"; then
    id=$(cat "$FILE")
    string="Disable jumping window $id"
    rm $FILE
    echo $string | osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-* -cgreen -d1 -O3 &
else
    id=$(xdotool getmouselocation | awk -F'window:' '{print $2}')
    string="Start jumping window $id"
    echo $id >"$HOME/.icewm/contrib/jumping_id.txt"
    echo $string | osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-* -cgreen -d1 -O3

while test -f "$FILE"; do
    id_saved=$(cat "$FILE")
    # echo "SAVED  "$id_saved
    id_hex=$(printf 0x%x $id_saved)
    # echo $id_hex
    # echo "XXX "$id_actual
    POS_X=$(xwininfo -id $id_saved | grep "Absolute upper-left X:" | sed 's/.*:  //')
    POS_Y=$(xwininfo -id $id_saved | grep "Absolute upper-left Y:" | sed 's/.*:  //')
    WINDOW_HEIGHT=$(xwininfo -id $id_saved | grep Height | sed 's/.*: //')
    DESKTOP_HEIGHT=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' | cut -d "x" -f2)
    MIN_Y=26
    MAX_Y=$((DESKTOP_HEIGHT-WINDOW_HEIGHT))
    # MAX_Y=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' | cut -d "x" -f2)
   
    id_actual=$(xdotool getmouselocation | awk -F'window:' '{print $2}')

    if [ "$id_actual" == "$id_saved" ]; then
        echo "I'm jumping" | osd_cat -A center -p middle -f -adobe-helvetica-bold-r-*-*-$font_width-120-*-*-*-*-*-* -cgreen -d1 -O3 &
        if (( $POS_Y < 30 )); then
            xdotool windowmove $id_saved $POS_X $MAX_Y
        else
            xdotool windowmove $id_saved $POS_X $MIN_Y
        fi
    fi

    sleep 0.3
done

fi
