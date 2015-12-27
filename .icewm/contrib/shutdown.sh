#! /bin/bash
# Shutdown menu

action=$(yad \
    --width 290 \
    --entry \
    --title "Exit" \
    --window-icon "system-shutdown" \
    --center \
    --button="gtk-close:1" \
    --button="_Switch User:2" \
    --button="gtk-ok:0" \
    --text "  Choose action:" \
    --entry-text \
    "Logout" "Reboot" "Power Off" "Suspend" "Hibernate" "Restart IceWM")
ret=$?

[[ $ret -eq 1 ]] && exit 0

if [[ $ret -eq 2 ]]; then
    gdmflexiserver &
    exit 0
fi

case $action in
    Logout*)
        case $(wmctrl -m | grep Name) in
            *IceWM*) cmd="pkill -u $USER" ;;
            *Openbox*) cmd="openbox --exit" ;;
            *FVWM*) cmd="FvwmCommand Quit" ;;
            *Metacity*) cmd="gnome-save-session --kill" ;; 
            *) exit 1 ;;
        esac
        ;;
    Reboot*) cmd="~/.icewm/reboot" ;;
    Power*) cmd="~/.icewm/shutdown" ;;
    Suspend*) cmd="sudo pm-suspend" ;;
    Hibernate*) cmd="sudo pm-hibernate" ;;
    Restart*) cmd="killall -SIGHUP icewm" ;;
    *) exit 1 ;;
esac

eval exec $cmd
