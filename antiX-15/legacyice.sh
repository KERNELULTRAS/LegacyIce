#!/bin/bash

# --------------------------------------
# Script to convert antiX15 to LegacyIce
# --------------------------------------

# (Only GTK and QT application)
# (In alphabetical order)

### Set background
echo -e "\e[40m\n\n"

### Velcome
echo -e "\e[38;5;227m----------------------------------------------------------\e[38;5;46m"
echo -e "\e[38;5;227m-- Installation LegacyIce by KERNEL ULTRAS               -\e[38;5;46m"
echo -e "\e[38;5;227m----------------------------------------------------------\e[38;5;46m\n"

### Goto to home directory
cd ~

# --------------------------------------
### Test architecture
# --------------------------------------
echo -e "\e[38;5;227m- Test architecture\e[38;5;46m\n"

if [ `arch` == "x86_64" ];then
	echo -e "Architecture x86 64bit\n\n"
	architecture="amd64"
	architecture_x="x86_64"
elif [[ `arch` == i* ]];then
	echo -e "Architecture x86 32bit\n\n"
	architecture="i386"
	architecture_x="i386"
else
	echo -e "Unsupported architecture\n\n"
	exit 1
fi

# --------------------------------------
### INSTALL AND UNINSTALL PROGRAMS
# --------------------------------------

### Install communication programs?
echo -e "\e[38;5;227m- Install communication programs? - Mumble, Pidgin\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_comms="yes";
fi

### Install graphics programs?
echo -e "\e[38;5;227m- Install graphics programs? - Blender, Gimp, Inkscape\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_graphs="yes";
fi

### Install network programs?
echo -e "\e[38;5;227m- Install network programs? - FileZilla\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_nets="yes";
fi

### Install utils?
echo -e "\e[38;5;227m- Install utils? - Galculator Medit Qpdfview\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_utils="yes";
fi

### Install web server?
echo -e "\e[38;5;227m- Install webserver? - Apache PHP MySQL\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_websrv="yes";
fi

### Edit debian sources list
echo -e "\e[38;5;227m- Edit Debian sources list\e[38;5;46m\n"
sudo sed -i 's/#deb-src http:\/\/ftp.us.debian.org\/debian\/ jessie main contrib non-free/deb-src http:\/\/ftp.us.debian.org\/debian\/ jessie main contrib non-free/g' /etc/apt/sources.list.d/debian.list
sudo sed -i 's/#deb http:\/\/www.deb-multimedia.org jessie main non-free/deb http:\/\/www.deb-multimedia.org jessie main non-free/g' /etc/apt/sources.list.d/debian.list

### Upgrade system
echo -e "\e[38;5;227m- Upgrade system\e[38;5;46m\n"
sudo apt-get --yes update
sudo apt-get --yes -o Dpkg::Options::="--force-confnew" upgrade
sudo apt-get --yes autoremove

echo -e "\e[38;5;227m- Install programs\e[38;5;46m\n"

### Core tools
sudo apt-get --yes install autopoint autoconf bc debfoster curl dh-autoreconf git g++ \
hsetroot intltool key-mon libgtk2.0-dev libnotify-bin linuxdoc-tools numlockx \
subversion synaptic telnet wget whois wmctrl software-properties-common xfce4-notifyd xosd-bin

### Graphics programs
if [[ $install_utils == "yes" ]]; then
	sudo apt-get --yes install blender gimp inkscape
fi
	
### Multimedia programs
sudo apt-get --yes install pulseaudio pavucontrol pasystray
# Install DeadBeef
curl -L  http://downloads.sourceforge.net/project/deadbeef/debian/0.6.2/deadbeef-static_0.6.2-2_$architecture.deb >deadbeef-static_0.6.2-2_$architecture.deb
sudo dpkg -i deadbeef-static_0.6.2-2_$architecture.deb
rm deadbeef-static_0.6.2-2_$architecture.deb

### Communication programs
if [[ $install_comms == "yes" ]]; then
	sudo apt-get --yes install mumble pidgin
fi

### Network programs
if [[ $install_nets == "yes" ]]; then
	sudo apt-get --yes install filezilla
fi

### Utils
if [[ $install_utils == "yes" ]]; then
	sudo apt-get --yes install galculator medit qpdfview
fi

### Web server
if [[ $install_websrv == "yes" ]]; then
	sudo apt-get --yes install mysql-server-core-5.5 mysql-server libaio1 mysql-client apache2-mpm-prefork libaprutil1 libapache2-mod-php5 php5-mysql php5-common libaprutil1-dbd-sqlite3 php5-readline mysql-client-5.5 libhtml-template-perl libterm-readkey-perl libaprutil1-ldap mysql-common php5-cli libmysqlclient18 apache2-data php5-json libapr1 apache2 mysql-server apache2-bin libdbd-mysql-perl libdbi-perl
fi

# Install Textadept
wget -P /tmp http://foicica.com/textadept/download/textadept_LATEST.$architecture_x.tgz
tar zxvf /tmp/textadept_LATEST.$architecture_x.tgz -C /tmp
rm /tmp/textadept_LATEST.$architecture_x.tgz
sudo cp -rf /tmp/textadept_8.5.$architecture_x/ /opt/textadept/
sudo ln -s /opt/textadept/textadept /usr/bin/textadept
sudo cp /opt/textadept/src/textadept.desktop /usr/share/applications
sudo cp /opt/textadept/core/images/textadept.png /usr/share/icons
if [[ -e "/home/$USER/.textadept/init.lua" ]]; then
	num=1
	while [[ -e "/home/$USER/.textadept/init.lua-back-$num" ]]; do
	(( num++ ))
	done
	mv "/home/$USER/.textadept/init.lua" "/home/$USER/.textadept/init.lua-back-$num"
fi

if [[ -e "/home/$USER/.textadept" ]]; then
  echo "ui.set_theme(not CURSES and 'dark' or 'custom_dark')" >$HOME/.textadept/init.lua
else
  mkdir $HOME/.textadept
  echo "ui.set_theme(not CURSES and 'dark' or 'custom_dark')" >$HOME/.textadept/init.lua
fi

### Languages
sudo apt-get --yes install iceweasel-l10n-cs iceweasel-l10n-sk libreoffice-l10n-cs libreoffice-l10n-sk

### IceWM
sudo apt-get --yes install compton
# Install patched IceWM
echo -e "\e[38;5;227m- Install patched IceWM\e[38;5;46m\n"
cd /tmp
git clone http://github.com/bbidulock/icewm.git
cd icewm/
./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --enable-shaped-decorations --enable-gradients --enable-guievents --with-icesound=ALSA,OSS --disable-menus-gnome2
make V=0
sudo make install
rm -rf /tmp/icewm
cd ~

### Remove unnecessary packages
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

### Install LightDM
sudo apt-get --yes install lightdm

# --------------------------------------
### SET THEMES
# --------------------------------------

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
if [[ -e "/home/$USER/.config/geany" ]]; then
	num=1
	while [[ -e "/home/$USER/.config/geany-back-$num" ]]; do
	(( num++ ))
	done
	mv "/home/$USER/.config/geany" "/home/$USER/.config/geany-back-$num"
fi
if [[ -e "/tmp/GeanyTheme-Dark" ]]; then
	rm -rf /tmp/GeanyTheme-Dark
fi
cd /tmp
git clone https://github.com/bedna-KU/GeanyTheme-Dark.git
mv GeanyTheme-Dark $HOME/.config/geany
cd ~

# --------------------------------------
### SET CONFIGS
# --------------------------------------

### Download IceWM config files
echo -e "\e[38;5;227m- Download IceWM config files\e[38;5;46m\n"
if [[ -e "/home/$USER/.icewm" ]]; then
	num=1
	while [[ -e "/home/$USER/.icewm-back-$num" ]]; do
	(( num++ ))
	done
	mv "/home/$USER/.icewm" "/home/$USER/.icewm-back-$num"
fi
svn checkout https://github.com/KERNELULTRAS/LegacyIce-antiX.git/trunk/.icewm

### COMPOSITOR

### Download compositor config files
echo -e "\e[38;5;227m- Setup compositor\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-15/compton.conf
if [[ -e "/home/$USER/.config/compton.conf" ]]; then
	num=1
	while [[ -e "/home/$USER/.config/compton.conf-back-$num" ]]; do
	(( num++ ))
	done
	mv "/home/$USER/.config/compton.conf" "/home/$USER/.config/compton.conf-back-$num"
fi
mv /tmp/compton.conf $HOME/.config/compton.conf

### USER SESSION

### Switch LightDM to IceWM
#echo -e "\e[38;5;227m- Switch LightDM to IceWM\e[38;5;46m\n"
#wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-15/user_xsession.py
#python /tmp/user_xsession.py --user-id 1000 set icewm-session

### Set LightDM wallpaper and GTK theme
echo -e "\e[38;5;227m- Set LightDM wallpaper and GTK theme\e[38;5;46m\n"
sudo cp .icewm/themes/LegacyIce-Dark/default.jpg /usr/share/wallpaper
sudo sed -i 's/background.*$/background=\/usr\/share\/wallpaper\/default.jpg/g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/^theme-name=.*$/theme-name=MediterraneanDarkest/g' /etc/lightdm/lightdm-gtk-greeter.conf

### Set LID sleep
echo -e "\e[38;5;227m- Set LID sleep\e[38;5;46m\n"
if [[ -e "/etc/default/acpi-support" ]]; then
	sudo sed -i 's/#LID_SLEEP=false/LID_SLEEP=true/g' /etc/default/acpi-support
fi

### Echo LegacyIce textinfo
echo -e "\e[38;5;227m- Setup .bashrc\e[38;5;46m\n"
echo "
echo -e \"\e[91m\"
echo \"@   @@@ @@@ @@@ @@@ @ @  @ @@@ @@@\"
echo \"@   @   @   @ @ @   @ @  @ @   @\"
echo \"@   @@@ @ @ @@@ @   @@@  @ @   @@@        /\\\\\"
echo \"@   @   @ @ @ @ @    @   @ @   @     /\\\\  /  \\\\  /\\\\\"
echo \"@@@ @@@ @@@ @ @ @@@  @   @ @@@ @@@  /  \\\\/    \\\\/  \\\\\"
echo -e \"\e[94m---------------------------------------------------\"">>$HOME/.bashrc
echo "date">>$HOME/.bashrc
echo "
echo \"---------------------------------------------------\"
echo -e \"\e[37m\"">>$HOME/.bashrc
echo "df -h | grep -e /dev/ -e Filesystem">>$HOME/.bashrc
echo "[ -n \"${PATH##*/sbin*}\" ] && PATH=$PATH:/sbin:/usr/sbin">>$HOME/.bashrc

### Clutter off (Off hide mouse)
echo -e "\e[38;5;227m- Clutter off\e[38;5;46m\n"
if [[ -e "/etc/default/unclutter" ]]; then
	sudo sed -i 's/START_UNCLUTTER="true"/START_UNCLUTTER="false"/g' /etc/default/unclutter
fi

### Roxterm configuration
echo -e "\e[38;5;227m- Setup Roxterm\e[38;5;46m\n"
if [[ -e "/home/$USER/.config/roxterm.sourceforge.net" ]]; then
	num=1
	while [[ -e "/home/$USER/.config/roxterm.sourceforge.net-back-$num" ]]; do
	(( num++ ))
	done
	mv "/home/$USER/.config/roxterm.sourceforge.net" "/home/$USER/.config/roxterm.sourceforge.net-back-$num"
fi
cd ~/.config
svn checkout https://github.com/KERNELULTRAS/LegacyIce-antiX.git/trunk/antiX-15/roxterm.sourceforge.net
cd ~

### Resize winoptions by xrandr
echo -e "\e[38;5;227m- Setup Winoptions\e[38;5;46m\n"
chmod +x .icewm/winoptions.sh
./.icewm/winoptions.sh

### Create menu
echo -e "\e[38;5;227m- Create menu\e[38;5;46m\n"
sudo sh -c "icewm-menu-fdo > /usr/share/icewm/menu"

### Update menu after install or uninstall programs
echo -e "\e[38;5;227m- Setup autoupdate menu\e[38;5;46m\n"
sudo sh -c "echo 'DPkg::Post-Invoke {\"icewm-menu-fdo>/usr/share/icewm/menu\";};' >/etc/apt/apt.conf.d/99-update-menus"

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
