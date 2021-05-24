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
echo -e "\e[93m-- Installation WebServer by KERNEL ULTRAS               -\e[38;5;46m"
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m\n"

### Web server
sudo apt --yes install mariadb-common mariadb-server mariadb-client libaio1 libaprutil1 libapache2-mod-php php-mysql php-common libaprutil1-dbd-sqlite3 php-readline libhtml-template-perl libterm-readkey-perl libaprutil1-ldap php-cli apache2-data php-json apache2 libapr1 apache2-bin php-mbstring php-gd
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
### Replace root path
echo -e "\e[93m- Replace root path\n"
sudo sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/home\/'$USER'\/www/g' /etc/apache2/sites-available/000-default.conf
### Replace root path
sudo sed -i 's/<Directory \/var\/www\/>/<Directory \/home\/'$USER'\/www\/>/g' /etc/apache2/apache2.conf
### Restart Web server
echo -e "\e[93m- Restart Apache\n"
sudo service apache2 restart

echo -e "\e[93m- All is done\e[38;5;46m\n"
echo -e "\e[0m\n"
