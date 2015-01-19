#!/bin/bash
# (Only GTK and QT application)
# (In alphabetical order)

### INSTALL PROGRAMS

echo -e "\e[38;5;227m- Install programs\e[38;5;46m\n"

### Dev programs
sudo apt-get --yes install filezilla geany ghex scribes

### Graphics programs
sudo apt-get --yes install blender dia freecad gimp inkscape librecad meshlab tupi pstoedit

### Multimedia programs
sudo apt-get --yes install brasero pavucontrol vlc

### Office
sudo apt-get --yes install libreoffice

### Communication programs
sudo apt-get --yes install ekiga mumble pidgin xchat

### Internet programs
sudo apt-get --yes install firefox putty remmina

### File managers
sudo apt-get --yes install spacefm

### Virtualization programs
# apt-get --yes install kvm qemu virt-manager

### Emulators (wine not is emulator :)
sudo apt-get --yes install wine

### Tools
sudo apt-get --yes install curl elinks gdebi git subversion gnome-terminal gparted htop keepassx mc nmap openjdk-6-jdk openjdk-7-jdk openjdk-6-jre openjdk-7-jre openssh-client openvpn scrot synaptic wget whois intltool libgtk2.0-dev wmctrl

### Local webserver
sudo apt-get --yes install mysql-server-core-5.5 mysql-server-5.5 libaio1 mysql-client-core-5.5 apache2-mpm-prefork libaprutil1 libapache2-mod-php5 php5-mysql php5-common  libaprutil1-dbd-sqlite3 php5-readline mysql-client-5.5 libhtml-template-perl libterm-readkey-perl libaprutil1-ldap mysql-common php5-cli libmysqlclient18 apache2-data php5-json libapr1 apache2 mysql-server apache2-bin libdbd-mysql-perl libdbi-perl

### Theme
sudo add-apt-repository ppa:noobslab/themes
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
sudo apt-get --yes remove ubuntu-desktop compiz-gnome ibus ibus-gtk ibus-gtk3 account-plugin-aim account-plugin-jabber account-plugin-salut account-plugin-yahoo empathy empathy-common telepathy-gabble telepathy-salut mcp-account-manager-uoa nautilus-sendto-empathy

### Make directory for user specific programs
echo -e "\e[38;5;227m- Create directory Programs\e[38;5;46m\n"
mkdir Programs

### Add bookmarks for Programs to Gnome3 (Nautilus) ...
echo -e "\e[38;5;227m- Create bookmarks for Programs\e[38;5;46m\n"
echo "file://$HOME/Programs" >> $HOME/.config/gtk-3.0/bookmarks

### Make directory for games trigger
echo -e "\e[38;5;227m- Create directory Games\e[38;5;46m\n"
mkdir Games

### Add bookmarks for Games to Gnome3 (Nautilus) ...
echo -e "\e[38;5;227m- Create bookmarks for Games\e[38;5;46m\n"
echo "file://$HOME/Games" >> $HOME/.config/gtk-3.0/bookmarks

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
include "/home/mario/.gtkrc-2.0.mine"' > $HOME/.gtkrc-2.0

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

echo -e "\e[38;5;227m- Set Shutdown and Reboot\e[38;5;46m\n"
sudo sh -c "echo \"%$USER  ALL = NOPASSWD: /sbin/poweroff\" > /etc/sudoers.d/shutdown"
sudo sh -c "echo \"%$USER  ALL = NOPASSWD: /sbin/reboot\" > /etc/sudoers.d/reboot"

### Instal YAD
echo -e "\e[38;5;227m- Install YAD\n\e[38;5;46m"
wget https://downloads.sourceforge.net/yad-dialog/files/yad-0.27.0.tar.xz
tar -xJf yad-0.27.0.tar.xz
rm yad-0.27.0.tar.xz
cd yad-0.27.0/
./configure
make
sudo make install
cd ..

### Download IceWM config files
echo -e "\e[38;5;227m- Download IceWM config files\e[38;5;46m\n"
wget https://raw.github.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/.icewm.tar.xz
echo -e "\e[38;5;227m- Extract IceWM config files\e[38;5;46m\n"
tar -xJf .icewm.tar.xz
rm .icewm.tar.xz

### Compositor
echo -e "\e[38;5;227m- Set compositor\e[38;5;46m\n"
wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/compton.conf
mv compton.conf $HOME/.config/compton.conf

### Geany theme
git clone https://github.com/bedna-KU/GeanyTheme-Dark.git
mv GeanyTheme-Dark $HOME/.config/geany

