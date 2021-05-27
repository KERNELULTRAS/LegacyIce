#!/bin/bash

# --------------------------------------
# Script to convert antiX16 to LegacyIce
# --------------------------------------

# (Only GTK and Xfce application)
# (In alphabetical order)

### Set background
echo -e "\e[40m\n\n"

### Velcome
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m"
echo -e "\e[93m Installation LegacyIce by KERNEL ULTRAS                  \e[38;5;46m"
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m\n"

# --------------------------------------
### Test architecture
# --------------------------------------
echo -e "\e[93m- Test architecture\e[38;5;46m\n"

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

### Remove unnecessary packages
echo -e "\e[93m- Remove unnecessary programs\e[38;5;46m\n"
sudo apt --yes purge leafpad \
desktop-defaults-fluxbox-antix \
desktop-defaults-hlwm-antix \
desktop-defaults-jwm-antix \
desktop-defaults-rox-antix \
desktop-defaults-spacefm-antix \
fluxbox-themes-antix \
icewm-themes-antix \
screenshot-antix \
fluxbox \
jwm \
herbstluftwm \
gftp-gtk \
mousepad \
rox-filer \
desktop-session-antix \
menu-icewm-antix \
menu-manager-antix \
wallpaper-antix \
dillo

sudo apt-get --yes autoremove

### Upgrade system
echo -e "\e[93m- Upgrade system\e[38;5;46m\n"
sudo apt --yes update
sudo apt --yes -o Dpkg::Options::="--force-confnew" upgrade
sudo apt --yes autoremove

echo -e "\e[93m- Install programs\e[38;5;46m\n"

### Core tools
sudo apt --yes install autopoint autoconf automake autogen bc curl debfoster earlyoom filezilla git g++ \
hsetroot intltool imagemagick key-mon libgtk2.0-dev libgdk-pixbuf2.0-dev libgnome-menu-3-dev libice-dev libsm-dev \
libtool libwnck-dev libx11-dev libxext-dev linuxdoc-tools \
m4 maim micro numlockx pasystray pavumeter pavucontrol paprefs pulseaudio restic software-properties-common thunar tumbler-plugins-extra \
subversion synaptic telnet wget whois wmctrl xfce4-terminal xosd-bin

### Murrine-themes
sudo apt --yes install murrine-themes

### Install LightDM
sudo apt --yes install lightdm

### Install Python utils
sudo apt install python3-pip

### Install xde-menu
echo -e "\e[93m Create menu\e[38;5;46m\n"
git clone https://github.com/bbidulock/xde-menu.git
cd xde-menu
./autogen.sh
./configure
make
sudo make DESTDIR="$pkgdir" install
rm -rf xde-menu

### Set autoupdate menu after install/uninstall package
echo 'DPkg::Post-Invoke {"xde-menu --menugen --wmname=icewm --format=icewm --root-menu /etc/xdg/menus/lxde-applications.menu --nolaunch --output /usr/share/icewm/menu";};' | sudo tee -a /etc/apt/apt.conf.d/99-update-menus
sudo xde-menu --menugen --wmname=icewm --format=icewm --root-menu /etc/xdg/menus/lxde-applications.menu --nolaunch --output /usr/share/icewm/menu

#=======================================================================================
### SET CONFIGS
#=======================================================================================

########################################################################################
### Copy IceWM config files
########################################################################################
echo -e "\e[93m Backup IceWM config files\e[38;5;46m\n"
if [[ -e "/home/$USER/.icewm" ]]; then
	num=1
	while [[ -e "/home/$USER/.icewm-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.icewm" "/home/$USER/.icewm-back-$num"
fi
# svn checkout https://github.com/KERNELULTRAS/LegacyIce-antiX.git/trunk/.icewm
echo -e "\e[93m Copy IceWM config files\e[38;5;46m\n"
cp -r antiX-20/configs/.icewm ~/.icewm
#***************************************************************************************

########################################################################################
### Copy .bashrc
########################################################################################
echo -e "\e[93m Backup BASH config file\e[38;5;46m\n"
if [[ -e "/home/$USER/.bashrc" ]]; then
	num=1
	while [[ -e "/home/$USER/.bashrc-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.bashrc" "/home/$USER/.bashrc-back-$num"
fi
# wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/antiX-20/.bashrc
echo -e "\e[93m Copy BASH config file\e[38;5;46m\n"
cp antiX-20/configs/.bashrc ~/.bashrc
#***************************************************************************************

########################################################################################
### Copy gtkrc-2.0
########################################################################################
echo -e "\e[93m Backup GTK-2 config file\e[38;5;46m\n"
if [[ -e "/home/$USER/.gtkrc-2.0" ]]; then
	num=1
	while [[ -e "/home/$USER/.gtk-2.0-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.gtkrc-2.0" "/home/$USER/.gtkrc-2.0-back-$num"
fi
# wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/antiX-20/.bashrc
echo -e "\e[93m Copy GTK-2 config file\e[38;5;46m\n"
cp antiX-20/configs/.gtkrc-2.0 ~/.gtkrc-2.0
#***************************************************************************************

########################################################################################
### Copy gtk-3.0
########################################################################################
echo -e "\e[93m Backup GTK-3 config file\e[38;5;46m\n"
if [[ -e "/home/$USER/.config/gtk-3.0" ]]; then
	num=1
	while [[ -e "/home/$USER/.config/gtk-3.0-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.config/gtk-3.0" "/home/$USER/.config/gtk-3.0-back-$num"
fi
# wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/antiX-20/.bashrc
echo -e "\e[93m Copy GTH-3 config file\e[38;5;46m\n"
cp -r antiX-20/configs/gtk-3.0 ~/.config/gtk-3.0
#***************************************************************************************

########################################################################################
### Copy Compton config
########################################################################################
echo -e "\e[93m Backup Compton config file\e[38;5;46m\n"
if [[ -e "/home/$USER/.config/compton.conf" ]]; then
	num=1
	while [[ -e "/home/$USER/.config/compton.conf-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.config/compton.conf" "/home/$USER/.config/compton.conf-back-$num"
fi
# wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/antiX-20/.bashrc
echo -e "\e[93m Copy Compton config file\e[38;5;46m\n"
cp -r antiX-20/configs/compton.conf ~/.config/compton.conf
#***************************************************************************************

### Clutter off (Off hide mouse)
echo -e "\e[93m Clutter off\e[38;5;46m\n"
if [[ -e "/etc/default/unclutter" ]]; then
	sudo sed -i 's/START_UNCLUTTER=true/START_UNCLUTTER=false/g' /etc/default/unclutter
	pkill unclutterf
fi

### Create menu
echo -e "\e[93m Create menu\e[38;5;46m\n"

### Rename ice_user_name to active user
echo -e "\e[93m Setup user name\e[38;5;46m\n"
find ~/.icewm -type f -print0 | xargs -0 sed -i "s/mario/$USER/g"

# Set background
hsetroot -extend ~/.icewm/themes/LegacyIce-Dark/default.jpg

### NetworkManager
echo -e "\e[93m Set NetworkManager\e[38;5;46m\n"
sudo apt --yes install network-manager network-manager-gnome
if [[ -e "/etc/NetworkManager/NetworkManager.conf" ]]; then
	sudo sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf
	sudo service network-manager restart
fi



### END OF SCRIPT
echo -e "\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[93m- Done, please restart and change session to IceWM\e[38;5;46m\n"
echo -e "\e[93m- Good luck\e[38;5;46m\n"
echo -e "\e[0m\n"
