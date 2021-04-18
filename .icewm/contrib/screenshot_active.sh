#! /bin/bash
maim -i $(xdotool getactivewindow) scr_$(date +%s).png
pacat -p .icewm/winoptions
