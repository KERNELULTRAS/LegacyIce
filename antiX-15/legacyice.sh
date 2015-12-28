#!/bin/bash

# --------------------------------------
# Script to convert antiX15 to LegacyIce
# --------------------------------------
# (Only GTK and QT application)
# (In alphabetical order)

### Set background
echo -e "\e[40m\n\n"

### Goto to home directory
cd ~

### UPGRADE SYSTEM
echo -e "\e[38;5;227m- Upgrade system\e[38;5;46m\n"
sudo apt-get --yes update
sudo apt-get --yes upgrade
sudo apt-get --yes autoremove

### INSTALL PROGRAMS
echo -e "\e[38;5;227m- Install programs\e[38;5;46m\n"

### Graphics programs
sudo apt-get --yes install blender gimp inkscape

### Multimedia programs
sudo apt-get --yes install pulseaudio pavucontrol pasystray

### Communication programs
sudo apt-get --yes install mumble pidgin

### Network programs
sudo apt-get --yes install filezilla

### Core tools
sudo apt-get --yes install autopoint autoconf debfoster curl dh-autoreconf git g++ \
hsetroot intltool key-mon libgtk2.0-dev lightdm linuxdoc-tools mousepad \
subversion synaptic telnet wget whois wmctrl software-properties-common xosd-bin

### IceWM
sudo apt-get --yes install compton

### REMOVE UNNECESSARY PACKAGES
echo -e "\e[38;5;227m- Remove unnecessary programs\e[38;5;46m\n"
sudo apt-get --yes purge leafpad \
desktop-defaults-fluxbox-antix \
desktop-defaults-hlwm-antix \
desktop-defaults-jwm-antix \
desktop-defaults-rox-antix \
desktop-defaults-spacefm-antix \
fluxbox-themes-antix \
icewm-themes-antix \
menu-fluxbox-antix \
menu-jwm-antix \
menu-fluxbox-antix \
screenshot-antix \
fluxbox \
jwm \
herbstluftwm \
gftp-gtk \
mousepad \
rox-filer \
antix-goodies \
add-key-antix \
add-start-antix \
desktop-defaults-base-antix \
desktop-defaults-core-antix \
desktop-defaults-full-antix \
desktop-defaults-icewm-antix \
desktop-session-antix \
droopy-antix \
connectshares-antix \
group-management-antix \
icewmcc-antix \
menu-icewm-antix \
menu-manager-antix \
mountbox-antix \
mouse-cc-antix \
set-screen-blank-antix \
system-antix \
user-management-antix \
wallpaper-antix \
slim
sudo apt-get --yes autoremove

### Make directory for user specific programs
# echo -e "\e[38;5;227m- Create directory Programs\e[38;5;46m\n"
# mkdir Programs

### Add bookmarks for Programs to Gnome3 (Nautilus) ...
# echo -e "\e[38;5;227m- Create bookmarks for Programs\e[38;5;46m\n"
# echo "file://$HOME/Programs" >> $HOME/.config/gtk-3.0/bookmarks

### SET THEME

### Set GTK2 theme
echo -e "\e[38;5;227m- Setup GTK2 theme\e[38;5;46m\n"

echo '# Any customization should be done in ~/.gtkrc-2.0.mine
include "/home/mario/.gtkrc-2.0.mine"
gtk-theme-name="MediterraneanDarkest"
gtk-icon-theme-name="Faenza-Cupertino-mini"
gtk-font-name="Sans 10"
gtk-cursor-theme-name="DMZ-White"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintfull"
' >$HOME/.gtkrc-2.0

### Set GTK3 theme
echo -e "\e[38;5;227m- Setup GTK3 theme\e[38;5;46m\n"

echo "[Settings]
gtk-theme-name=MediterraneanDarkest
gtk-icon-theme-name=Faenza-Cupertino-mini
gtk-font-name=Sans 10
gtk-cursor-theme-name=DMZ-White
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull" >$HOME/.config/gtk-3.0/settings.ini

### Geany theme
echo -e "\e[38;5;227m- Setup Geany theme\e[38;5;46m\n"

source=$HOME/.config/geany
dest_dir=$HOME/.config

file=$(basename $source)
basename=${file%.*}

# Backup old Geany config
if [ -d "$source" ]
  then
    if [[ ! -e "$dest_dir/$basename" ]]; then
      # file does not exist in the destination directory
      mv "$source" "$dest_dir"
    else
      num=1
      while [[ -e "$dest_dir/$basename$num" ]]; do
      (( num++ ))
      done
      mv "$source" "$dest_dir/$basename$num"
    fi
fi

rm -rf /tmp/GeanyTheme-Dark
cd /tmp
git clone https://github.com/bedna-KU/GeanyTheme-Dark.git
mv GeanyTheme-Dark $HOME/.config/geany
cd ~

### INSTALL ICEWM

### Download IceWM config files
echo -e "\e[38;5;227m- Download IceWM config files\e[38;5;46m\n"
if [ -d ~/.icewm ]
  then
    mv ~/.icewm ~/.icewm.legacyice.backup
fi
svn checkout https://github.com/KERNELULTRAS/LegacyIce-antiX.git/trunk/.icewm

### Install patched IceWM
echo -e "\e[38;5;227m- Install patched IceWM\e[38;5;46m\n"
cd /tmp
git clone http://github.com/bbidulock/icewm.git
cd icewm/
./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --enable-shaped-decorations --enable-gradients --enable-guievents --with-icesound=ALSA,OSS --disable-menus-gnome2
make V=0
sudo make install
cd ~

### COMPOSITOR

### Download compositor config files
echo -e "\e[38;5;227m- Setup compositor\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-15/compton.conf
mv $HOME/.config/compton.conf $HOME/.config/compton.conf.back
mv /tmp/compton.conf $HOME/.config/compton.conf

### USER SESSION

### Switch LightDM to IceWM
echo -e "\e[38;5;227m- Switch LightDM to IceWM\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-15/user_xsession.py
python /tmp/user_xsession.py --user-id 1000 set icewm-session

[ -z "${PATH##*/sbin*}" ] && PATH=$PATH:/sbin:/usr/sbin

### Echo LegacyIce textinfo
echo -e "\e[38;5;227m- Setup .bashrc\e[38;5;46m\n"
echo "
echo -e \"\e[38;5;9m\"
echo \"@   @@@ @@@ @@@ @@@ @ @  @ @@@ @@@\"
echo \"@   @   @   @ @ @   @ @  @ @   @\"
echo \"@   @@@ @ @ @@@ @   @@@  @ @   @@@        /\\\\\"
echo \"@   @   @ @ @ @ @    @   @ @   @     /\\\\  /  \\\\  /\\\\\"
echo \"@@@ @@@ @@@ @ @ @@@  @   @ @@@ @@@  /  \\\\/    \\\\/  \\\\\"
echo -e \"\e[38;5;33m---------------------------------------------------\"">>$HOME/.bashrc
echo "date">>$HOME/.bashrc
echo "
echo \"---------------------------------------------------\"
echo -e \"\e[37;5;239mFilesystem......Size..Used..Avail.Us%.Mounted on\e[38;5;184m\"">>$HOME/.bashrc
echo "df -h | grep -i /dev/">>$HOME/.bashrc

### Clutter off (Off hide mouse)
echo -e "\e[38;5;227m- Clutter off\e[38;5;46m\n"
sudo sed -i 's/START_UNCLUTTER="true"/START_UNCLUTTER="false"/g' /etc/default/unclutter

### Roxterm configuration
echo -e "\e[38;5;227m- Setup Roxterm\e[38;5;46m\n"
sudo sed -i 's/hide_menubar=0/hide_menubar=1/g' $HOME/.config/roxterm.sourceforge.net/Profiles/Default

### Resize winoptions by xrandr
echo -e "\e[38;5;227m- Setup Winoptions\e[38;5;46m\n"
./.icewm/winoptions.sh

### Create menu
echo -e "\e[38;5;227m- Create menu\e[38;5;46m\n"
icewm-menu-fdo>$HOME/.icewm/menu

### Update menu after install or uninstall programs
echo -e "\e[38;5;227m- Setup autoupdate menu\e[38;5;46m\n"
sudo sh -c "echo 'DPkg::Post-Invoke {\"icewm-menu-fdo>\$HOME/.icewm/menu\";};' >/etc/apt/apt.conf.d/99-update-menus"

### Rename ice_user_name to active user
echo -e "\e[38;5;227m- Setup user name\e[38;5;46m\n"
find ~/.icewm -type f -print0 | xargs -0 sed -i "s/mario/$USER/g"

### END OF SCRIPT
echo -e "\n"
echo -e "\e[38;5;227m##################################################\e[38;5;46m\n"
echo -e "\e[38;5;227m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[38;5;227m- Done, please restart and change session to IceWM\e[38;5;46m\n"
echo -e "\e[38;5;227m- Good luck\e[38;5;46m\n"
echo -e "\e[0m\n"
