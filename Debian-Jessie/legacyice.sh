#!/bin/bash

# -------------------------------------
# Script to convert Debian to LegacyIce
# -------------------------------------
# (Only GTK and QT application)
# (In alphabetical order)

### Set background
echo -e "\e[40m\n\n"

### Goto to home directory
cd ~

### INSTALL PROGRAMS
echo -e "\e[38;5;227m- Install programs\e[38;5;46m\n"

### Dev programs
sudo apt-get --yes install geany

### Multimedia programs
sudo apt-get --yes install pavucontrol vlc

### Communication programs
sudo apt-get --yes install pidgin xchat

### Internet programs
sudo apt-get --yes install firefox

### File managers
sudo apt-get --yes install pcmanfm

### Core tools
sudo apt-get --yes install autopoint autoconf curl dh-autoreconf gdebi git gnome-terminal hsetroot intltool libgtk2.0-dev network-manager-gnome numlockx pasystray scrot subversion synaptic wget whois wmctrl linuxdoc-tools mousepad

### Theme
sudo add-apt-repository --yes ppa:noobslab/themes
sudo apt-get update
sudo apt-get --yes install hackstation-theme
sudo apt-get --yes install gtk2-engines-qtcurve

# Icons
#sudo add-apt-repository ppa:noobslab/icons
#sudo apt-get update
#sudo apt-get install ghost-flat-icons

### IceWM
sudo apt-get --yes install icewm compton

### REMOVE UNNECESSARY PACKAGES
echo -e "\e[38;5;227m- Remove unnecessary programs\e[38;5;46m\n"
# sudo apt-get --yes remove ibus
# sudo apt-get --yes autoremove

### Make directory for user specific programs
echo -e "\e[38;5;227m- Create directory Programs\e[38;5;46m\n"
mkdir Programs

### Add bookmarks for Programs to Gnome3 (Nautilus) ...
echo -e "\e[38;5;227m- Create bookmarks for Programs\e[38;5;46m\n"
echo "file://$HOME/Programs" >> $HOME/.config/gtk-3.0/bookmarks

### Install patched IceWM
echo -e "\e[38;5;227m- Install patched IceWM\e[38;5;46m\n"
cd /tmp
git clone http://github.com/bbidulock/icewm.git
cd icewm/
./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --enable-shaped-decorations --enable-gradients --enable-guievents --with-icesound=ALSA,OSS --disable-menus-gnome2
make V=0
sudo mv src/icewm /usr/bin/icewm
cd ~

### Install YAD
echo -e "\e[38;5;227m- Install YAD\n\e[38;5;46m"
wget -P /tmp https://downloads.sourceforge.net/yad-dialog/files/yad-0.27.0.tar.xz
cd /tmp
tar -xJf yad-0.27.0.tar.xz
rm yad-0.27.0.tar.xz
cd yad-0.27.0/
./configure
make
sudo make install
cd ~

### SET THEME

### Set Gnome2 theme

echo -e "\e[38;5;227m- Set Gnome2 theme\e[38;5;46m\n"

echo '# Any customization should be done in ~/.gtkrc-2.0

gtk-theme-name="HackStation"
gtk-icon-theme-name="Neu"
gtk-font-name="Sans 10"
gtk-cursor-theme-name="DMZ-White"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintslight"
gtk-xft-rgba="rgb"
gtk-color-scheme="tooltip_fg_color:#000000\nbase_color:#2E3436\nselected_fg_color:#7AA3CC\ntext_color:#D3D7CF\nbg_color:#555753\ntooltip_bg_color:#EDDE5C\nselected_bg_color:#3F403D\nfg_color:#E6E6E6\n"
include "/home/'$USER'/.gtkrc-2.0.mine"' > $HOME/.gtkrc-2.0

### Set Gnome3 theme

echo -e "\e[38;5;227m- Set Gnome3 theme\e[38;5;46m\n"

echo "[Settings] 
gtk-theme-name=HackStation
gtk-icon-theme-name=Neu
gtk-font-name=Sans 10
gtk-cursor-theme-name=DMZ-White
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
gtk-color-scheme=tooltip_fg_color:#000000\nbase_color:#2E3436\nselected_fg_color:#7AA3CC\ntext_color:#D3D7CF\nbg_color:#555753\ntooltip_bg_color:#EDDE5C\nselected_bg_color:#3F403D\nfg_color:#E6E6E6\n" > $HOME/.config/gtk-3.0/settings.ini

### Geany theme
echo -e "\e[38;5;227m- Set Geany theme\e[38;5;46m\n"
cd /tmp
git clone https://github.com/bedna-KU/GeanyTheme-Dark.git
mv GeanyTheme-Dark $HOME/.config/geany
cd ~

### SET PERMISSIONS FOR SHUTDOWN AND REBOOT
echo -e "\e[38;5;227m- Set permissions for shutdown and reboot\e[38;5;46m\n"
sudo sh -c "echo \"%$USER  ALL = NOPASSWD: /sbin/poweroff\" > /etc/sudoers.d/shutdown"
sudo sh -c "echo \"%$USER  ALL = NOPASSWD: /sbin/reboot\" > /etc/sudoers.d/reboot"

### Download IceWM config files
echo -e "\e[38;5;227m- Download IceWM config files\e[38;5;46m\n"
if [ -d ~/.icewm ]
  then
    mv ~/.icewm ~/.icewm.legacyice.backup
fi
svn checkout https://github.com/KERNELULTRAS/LegacyIce.git/trunk/.icewm

### Rename ice_user_name to active user
find ~/.icewm -type f -print0 | xargs -0 sed -i "s/ice_user_name/$USER/g"

### COMPOSITOR

### Download compositor config files
echo -e "\e[38;5;227m- Set compositor\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/compton.conf
mv /tmp/compton.conf $HOME/.config/compton.conf

### REMOVE SPLASH SCREEN
echo -e "\e[38;5;227m- Remove splash screen\e[38;5;46m\n"
sudo sed -i 's/quiet splash//' /etc/default/grub
sudo update-grub

### USER SESSION

### Switch LightDM to IceWM
echo -e "\e[38;5;227m- Switch LightDM to IceWM\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/user_xsession.py
python /tmp/user_xsession.py --user-id 1000 set icewm-session

### MENU

### MenuMaker installation
echo -e "\e[38;5;227m- Install MenuMaker\e[38;5;46m\n"
wget -P /tmp https://downloads.sourceforge.net/menumaker/files/menumaker-0.99.7.tar.gz
cd /tmp
tar -zxvf menumaker-0.99.7.tar.gz
cd menumaker-0.99.7/
./configure
sudo make install
cd ~

# Run MenuMaker
mmaker -f --no-legacy --no-debian -t Gterm IceWM

### Launch MenuMaker after install or uninstall programs
echo -e "\e[38;5;227m- Set autorun MenuMaker\e[38;5;46m\n"
sudo sh -c "echo 'DPkg::Post-Invoke {\"mmaker -f --no-legacy --no-debian -t Gterm IceWM\";};' > /etc/apt/apt.conf.d/00mmaker"

### END OF SCRIPT
echo -e "\n"
echo -e "\e[38;5;227m##################################################\e[38;5;46m\n"
echo -e "\e[38;5;227m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[38;5;227m- Done, please restart and change session to IceWM\e[38;5;46m\n"
echo -e "\e[38;5;227m- Good luck\e[38;5;46m\n"
echo -e "\e[0m\n"
