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
# sudo apt-get --yes install geany

### Multimedia programs
# sudo apt-get --yes install vlc

### Communication programs
sudo apt-get --yes install pidgin xchat

### Internet programs
# sudo apt-get --yes install firefox

### File managers
# sudo apt-get --yes install spacefm

### Core tools
sudo apt-get --yes install autopoint autoconf curl dh-autoreconf git
sudo apt-get --yes install hsetroot intltool key-mon libgtk2.0-dev linuxdoc-tools mousepad
sudo apt-get --yes install subversion synaptic wget whois wmctrl
sudo apt-get --yes install software-properties-common

### IceWM
sudo apt-get --yes install compton

### REMOVE UNNECESSARY PACKAGES
echo -e "\e[38;5;227m- Remove unnecessary programs\e[38;5;46m\n"
sudo apt-get --yes remove hexchat leafpad \
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
herbstluftwm
sudo apt-get --yes autoremove

### Make directory for user specific programs
# echo -e "\e[38;5;227m- Create directory Programs\e[38;5;46m\n"
# mkdir Programs

### Add bookmarks for Programs to Gnome3 (Nautilus) ...
# echo -e "\e[38;5;227m- Create bookmarks for Programs\e[38;5;46m\n"
# echo "file://$HOME/Programs" >> $HOME/.config/gtk-3.0/bookmarks

### SET THEME

### Set Gnome2 theme

### Set Gnome3 theme

### Geany theme
echo -e "\e[38;5;227m- Set Geany theme\e[38;5;46m\n"
cd /tmp
git clone https://github.com/bedna-KU/GeanyTheme-Dark.git
mv GeanyTheme-Dark $HOME/.config/geany
cd ~

### Download IceWM config files
echo -e "\e[38;5;227m- Download IceWM config files\e[38;5;46m\n"
if [ -d ~/.icewm ]
  then
    mv ~/.icewm ~/.icewm.legacyice.backup
fi
svn checkout https://github.com/KERNELULTRAS/LegacyIce.git/trunk/.icewm

### Rename ice_user_name to active user
find ~/.icewm -type f -print0 | xargs -0 sed -i "s/ice_user_name/$USER/g"

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

### COMPOSITOR

### Download compositor config files
echo -e "\e[38;5;227m- Set compositor\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/compton.conf
mv /tmp/compton.conf $HOME/.config/compton.conf

### USER SESSION

### MENU

### MenuMaker installation
# echo -e "\e[38;5;227m- Install MenuMaker\e[38;5;46m\n"
# wget -P /tmp https://downloads.sourceforge.net/menumaker/files/menumaker-0.99.7.tar.gz
# cd /tmp
# tar -zxvf menumaker-0.99.7.tar.gz
# cd menumaker-0.99.7/
# ./configure
# sudo make install
# cd ~

# Run MenuMaker
# mmaker -f --no-debian IceWM

### Launch MenuMaker after install or uninstall programs
# echo -e "\e[38;5;227m- Set autorun MenuMaker\e[38;5;46m\n"
# sudo sh -c "echo 'DPkg::Post-Invoke {\"mmaker -f --no-debian -t Gterm IceWM\";};' >/etc/apt/apt.conf.d/00mmaker"
# sudo sh -c "echo 'DPkg::Post-Invoke {\"mmaker -f --no-debian -t Gterm IceWM\";};' >/etc/apt/apt.conf.d/99-update-menus"

### END OF SCRIPT
echo -e "\n"
echo -e "\e[38;5;227m##################################################\e[38;5;46m\n"
echo -e "\e[38;5;227m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[38;5;227m- Done, please restart and change session to IceWM\e[38;5;46m\n"
echo -e "\e[38;5;227m- Good luck\e[38;5;46m\n"
echo -e "\e[0m\n"
