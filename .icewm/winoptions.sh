#!/bin/bash

cp .icewm/winoptions .icewm/winoptions.back

# Get your X resolution
x_res=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f1)

# Get your Y resolution
y_res=$(xrandr --current | grep '*' | uniq | awk '{print $1}' |  cut -d 'x' -f2)

# For test
# x_res=1024
# y_res=600

# Deducted width of IceWM panel
y_res=$(bc -l <<< $y_res-28)

echo "Your X resolution: "$x_res
echo "Your Y resolution (minus 28px panel): "$y_res

# Calculate your X reulution to 1600
x_factor=$(bc -l <<< 1600/$x_res)

# Calculate your Y reulution to 1200-28 (28 = width of IceWM panel)
y_factor=$(bc -l <<< 1172/$y_res)

# Replace number greather then 99 with function (OLD)
# sed -r -e 's/[1-9][0-9]+/"`x_m &`"/g' winoptions

echo "1600 / Your X resolution: "$x_factor
echo "1200 / Your Y resolution: "$y_factor

# Calculate your x resolution
function x_m { echo $1/$x_factor | bc | tr -d '\n'; };

# Calculate your x resolution
function y_m { echo $1/$y_factor | bc | tr -d '\n'; };

# For test
# echo "Test: "`x_m 350`

echo "
# Tools
# xprop | grep -i wm_class
# wmctrl -lpGx | grep -i 'Firefox'

AWTapp.icon: java
# workaround for XV window repositioning problems
xv.nonICCCMconfigureRequest: 1

TaskBar.doNotCover: 1					# Window over panel
TaskBar.ignoreQuickSwitch: 1	# Dont show in quick list
TaskBar.noFocusOnAppRaise: 1	# If set to 1, window will not automatically get focus as application raises it.

# pcmanfm.ignoreWinList: 1	# Dont show in window list
# pcmanfm.ignoreTaskBar: 1	# Dont show in task bar
# pcmanfm.ignoreQuickSwitch:1	# Dont show in quick list

Pidgin.Pidgin.geometry: `x_m 350`x`y_m 1127`+`x_m 1250`+0	# Resize Pidgin
Pidgin.Pidgin.tray: Exclusive		# Pidgin only in taskbar
Pidgin.Pidgin.allWorkspaces: 1		# Pidgin on all warkspaces

xchat.Xchat.tray: Exclusive		# XChat only in taskbar
xchat.Xchat.ignoreTaskBar: 1		# XChat ignore tasbar
# xchat.Xchat.allWorkspaces: 1		# XChat on all warkspaces

hexchat.Haxchat.tray: Exclusive		# XChat only in taskbar
hexchat.Hexchat.ignoreTaskBar: 1		# XChat ignore tasbar

veromix.tray: Exclusive
veromix.ignoreTaskBar: 1

key-mon.Key-mon.allWorkspaces: 1	# Key-mon on all warkspaces
key-mon.Key-mon.ignoreQuickSwitch:1	# Key-mon dont show in quick list

pycam-main.geometry: `x_m 796`x`y_m 1152`+0+0	# Dimensions
pycam-view.geometry: `x_m 796`x`y_m 1152`+`x_m 800`+0	# Dimensions

gnome-terminal.Gnome-terminal.dTitleBar: 0	# Hide title bar on terminal
gnome-terminal.Gnome-terminal.dBorder: 0	# Hide border on terminal

roxterm.Roxterm.dTitleBar: 0      # Hide title bar on terminal
roxterm.Roxterm.dBorder: 0        # Hide border on terminal
roxterm.Roxterm.ignoreNoFocusHinto: 1 # Autofocus terminal

Mousepad.geometry: `x_m 800`×`y_m 1172`+0+0	# Dimensions
gedit.Gedit.geometry: `x_m 1350`x`y_m 1180`+0+0	# Resize Gedit
textadept.Textadept.geometry: `x_m 800`×`y_m 1172`+0+0	# Dimensions

nautilus.Nautilus.geometry: `x_m 350`x`y_m 1127`+`x_m 1250`+0	# Dimensions
thunar.Thunar.geometry: `x_m 800`×`y_m 1172`	# Dimensions
spacefm.Spacefm.geometry: `x_m 790`x`y_m 1172`	# Dimensions

# Blender.Blender.startMaximized: 1	#
Blender.Blender.geometry: `x_m 1600`x`y_m 1172`	# Blender maximized

gimp-2.8.Gimp-2.8.geometry: `x_m 1600`x`y_m 1172`	# Gimp maximized

screen.Screen.ignoreQuickSwitch: 1	# Dont show in quick list

# First workspace

Navigator.Iceweasel.workspace: 0	# Run on first workspace
geany.Geany.workspace: 0	# Run on first workspace

# Second workspace

# Third workspace

# Fourth workspace
" >$HOME/.icewm/winoptions
