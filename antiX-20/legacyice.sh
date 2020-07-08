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

# --------------------------------------
### INSTALL AND UNINSTALL PROGRAMS
# --------------------------------------

### Install communication programs?
echo -e "\e[93m- Install communication programs? - Mumble, Quassel\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_comms="yes";
fi

### Install graphics programs?
echo -e "\e[93m- Install graphics programs? - Blender, Gimp, Inkscape, Photoflare\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_graphs="yes";
fi

### Install network programs?
echo -e "\e[93m- Install network programs? - FileZilla\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_nets="yes";
fi

### Install utils?
echo -e "\e[93m- Install utils? - SpeedCrunch Micro\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_utils="yes";
fi

### Install web server?
echo -e "\e[93m- Install webserver? - Apache PHP MySQL\e[38;5;46m\n"
read -r -p "Install? [N/y] " response
response=${response,,} # tolower
if [[ $response =~ ^(no|n) ]] || [ -z $response ]; then
  echo -e "NO\n";
else
  echo -e "YES\n";
  install_websrv="yes";
fi

### Edit debian sources list
# echo -e "\e[93m- Edit Debian sources list\e[38;5;46m\n"
# sudo sed -i 's/#deb-src http:\/\/ftp.us.debian.org\/debian\/ jessie main contrib non-free/deb-src http:\/\/ftp.us.debian.org\/debian\/ jessie main contrib non-free/g' /etc/apt/sources.list.d/debian.list
# sudo sed -i 's/#deb http:\/\/www.deb-multimedia.org jessie main non-free/deb http:\/\/www.deb-multimedia.org jessie main non-free/g' /etc/apt/sources.list.d/debian.list

### Remove unnecessary packages
echo -e "\e[93m- Remove unnecessary programs\e[38;5;46m\n"
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
desktop-session-antix \
menu-icewm-antix \
menu-manager-antix \
wallpaper-antix
sudo apt-get --yes autoremove

### Upgrade system
echo -e "\e[93m- Upgrade system\e[38;5;46m\n"
sudo apt-get --yes update
sudo apt-get --yes -o Dpkg::Options::="--force-confnew" upgrade
sudo apt-get --yes autoremove

echo -e "\e[93m- Install programs\e[38;5;46m\n"

### Core tools
sudo apt-get --yes install autopoint autoconf automake autogen bc curl debfoster earlyoom git g++ \
hsetroot intltool imagemagick key-mon libgdk-pixbuf2.0-dev libgnome-menu-3-dev libgtk2.0-dev libice-dev libsm-dev \
libtool libwnck-dev libx11-dev libxext-dev linuxdoc-tools lximage-qt\
m4 numlockx pavumeter pavucontrol paprefs pcmanfm-qt qterminal \
subversion synaptic telnet wget whois wmctrl software-properties-common xfce4-notifyd xosd-bin

### Graphics programs
if [[ $install_graphs == "yes" ]]; then
	sudo apt-get --yes install blender gimp inkscape photoflare
fi

### Multimedia programs
sudo apt-get --yes install pulseaudio pavucontrol pasystray

### Communication programs
if [[ $install_comms == "yes" ]]; then
	sudo apt-get --yes install mumble quassel
fi

### Network programs
if [[ $install_nets == "yes" ]]; then
	sudo apt-get --yes install filezilla
fi

### Utils
if [[ $install_utils == "yes" ]]; then
	sudo apt-get --yes install speedcrunch micro
fi

### Web server
if [[ $install_websrv == "yes" ]]; then
	sudo apt-get --yes install mariadb-common mariadb-server mariadb-client libaio1 libaprutil1 libapache2-mod-php php-mysql php-common libaprutil1-dbd-sqlite3 php-readline libhtml-template-perl libterm-readkey-perl libaprutil1-ldap php-cli apache2-data php-json apache2 libapr1 apache2-bin php-mbstring php-gd
	### Set apache root to HomeDirectory/www
	echo -e "\e[93m- Set Apache path to HomeDirectory/www\n"
	### Exist www directory?
	if [[ -e "$HOME/www" ]]; then
			echo -e "\e[93m- Directory /home/"$USER"/www already exist\n"
	else
			echo -e "\e[93m- Make dir /home/"$USER"/www\n"
			mkdir '/home/'$USER'/www'
			chmod 0777 '/home/'$USER'/www'
	fi
	### Rplace root path
	echo -e "\e[93m- Replace root path\n"
	sudo sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/home\/'$USER'\/www/g' /etc/apache2/sites-available/000-default.conf
	### Replace root path
	sudo sed -i 's/<Directory \/var\/www\/>/<Directory \/home\/'$USER'\/www\/>/g' /etc/apache2/apache2.conf
	### Restart Web server
	echo -e "\e[93m- Restart Apache\n"
	sudo service apache2 restart
fi

### Languages
# sudo apt-get --yes install libreoffice-l10n-cs libreoffice-l10n-sk

### Desktop
sudo apt-get --yes install compton

### Install LightDM
sudo apt-get --yes install lightdm

### Install Python utils
sudo apt install python3-pip

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

### COMPOSITOR

### Download compositor config files
echo -e "\e[93m- Setup compositor\e[38;5;46m\n"
wget -P /tmp https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-15/compton.conf
if [[ -e "/home/$USER/.config/compton.conf" ]]; then
	num=1
	while [[ -e "/home/$USER/.config/compton.conf-back-$num" ]]; do
		(( num++ ))
	done
	mv "/home/$USER/.config/compton.conf" "/home/$USER/.config/compton.conf-back-$num"
fi
mv /tmp/compton.conf $HOME/.config/compton.conf

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
sudo sh -c "icewm-menu-fdo > /usr/share/icewm/menu"

### Update menu after install or uninstall programs
#echo -e "\e[93m- Setup autoupdate menu\e[38;5;46m\n"
#sudo sh -c "echo 'DPkg::Post-Invoke {\"icewm-menu-fdo>/usr/share/icewm/menu\";};' >/etc/apt/apt.conf.d/99-update-menus"
# xde-menu --menugen --wmname=icewm --format=icewm --root-menu /etc/xdg/menus/lxde-applications.menu --nolaunch --output ~/.config/icewm/menu
### Rename ice_user_name to active user
echo -e "\e[93m- Setup user name\e[38;5;46m\n"
find ~/.icewm -type f -print0 | xargs -0 sed -i "s/mario/$USER/g"

### END OF SCRIPT
echo -e "\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[93m- Done, please restart and change session to IceWM\e[38;5;46m\n"
echo -e "\e[93m- Good luck\e[38;5;46m\n"
echo -e "\e[0m\n"
