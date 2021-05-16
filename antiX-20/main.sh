#!/bin/bash

# --------------------------------------
# Script to convert antiX16 to LegacyIce
# --------------------------------------

# (Only GTK and QT application)
# (In alphabetical order)

### Set background
echo -e "\e[40m\n\n"

### Velcome
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m"
echo -e "\e[93m-- Installation LegacyIce by KERNEL ULTRAS               -\e[38;5;46m"
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m\n"

### Goto to home directory
cd ~

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
wallpaper-antix
sudo apt-get --yes autoremove

### Upgrade system
echo -e "\e[93m- Upgrade system\e[38;5;46m\n"
sudo apt --yes update
sudo apt --yes -o Dpkg::Options::="--force-confnew" upgrade
sudo apt --yes autoremove

echo -e "\e[93m- Install programs\e[38;5;46m\n"

### Core tools
sudo apt --yes install autopoint autoconf automake autogen bc curl debfoster earlyoom git g++ \
hsetroot intltool imagemagick key-mon libgdk-pixbuf2.0-dev libgnome-menu-3-dev libgtk2.0-dev libice-dev libsm-dev \
libtool libwnck-dev libx11-dev libxext-dev linuxdoc-tools \
m4 micro numlockx pavumeter pavucontrol paprefs restic software-properties-common thunar tumbler-plugins-extra \
subversion synaptic telnet wget whois wmctrl xfce4-terminal xosd-bin

### NetworkManager
echo -e "\e[93m- Set NetworkManager\e[38;5;46m\n"
sudo apt --yes install network-manager network-manager-gnome
if [[ -e "/etc/NetworkManager/NetworkManager.conf" ]]; then
	sudo sed -i 's/managed=False/managed=True/g' /etc/NetworkManager/NetworkManager.conf
	sudo service network-manager restart
fi

### Murrine-themes
sudo apt --yes install murrine-themes

### Install LightDM
sudo apt --yes install lightdm

### Install Python utils
sudo apt install python3-pip

### Install xde-menu
echo -e "\e[93m- Create menu\e[38;5;46m\n"
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

# --------------------------------------
### SET THEMES
# --------------------------------------

# --------------------------------------
### SET CONFIGS
# --------------------------------------

### Download IceWM config files
echo -e "\e[93m- Download IceWM config files\e[38;5;46m\n"
if [[ -e "/home/$USER/.icewm" ]]; then
	num=1
	while [[ -e "/home/$USER/.icewm-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.icewm" "/home/$USER/.icewm-back-$num"
fi
svn checkout https://github.com/KERNELULTRAS/LegacyIce-antiX.git/trunk/.icewm

### Backup .bashrc
if [[ -e "/home/$USER/.bashrc" ]]; then
	num=1
	while [[ -e "/home/$USER/.bashrc.conf-back-$num" ]]; do
		(( num++ ))
	done
	cp "/home/$USER/.bashrc" "/home/$USER/.bashrc.conf-back-$num"
fi

### Echo LegacyIce textinfo
echo -e "\e[93m- Add TEXT to .bashrc\e[38;5;46m\n"
if grep -q "@   @@@ @@@ @@@ @@@ @ @  @ @@@ @@@" .bashrc
then
    echo -e "\e[93m- Skip .bashrc\e[38;5;46m\n"
else
	echo -e "\e[93m- Setup .bashrc\e[38;5;46m\n"
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
	echo "[ -n \"${PATH##*/sbin*}\" ] && PATH=$PATH:/sbin:/usr/sbin">>$HOME/.bashrc
fi

### Clutter off (Off hide mouse)
echo -e "\e[93m- Clutter off\e[38;5;46m\n"
if [[ -e "/etc/default/unclutter" ]]; then
	sudo sed -i 's/START_UNCLUTTER=true/START_UNCLUTTER=false/g' /etc/default/unclutter
	pkill unclutterf
fi

### Resize winoptions by xrandr
echo -e "\e[93m- Setup Winoptions\e[38;5;46m\n"
chmod +x .icewm/winoptions.sh
./.icewm/winoptions.sh

### Create menu
echo -e "\e[93m- Create menu\e[38;5;46m\n"

### Rename ice_user_name to active user
echo -e "\e[93m- Setup user name\e[38;5;46m\n"
find ~/.icewm -type f -print0 | xargs -0 sed -i "s/mario/$USER/g"

# Set background
hsetroot -extend .icewm/themes/LegacyIce-Dark/default.jpg

### END OF SCRIPT
echo -e "\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[93m- Done, please restart and change session to IceWM\e[38;5;46m\n"
echo -e "\e[93m- Good luck\e[38;5;46m\n"
echo -e "\e[0m\n"
