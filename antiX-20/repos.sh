#!/bin/bash

# --------------------------------------
# Script to convert antiX16 to LegacyIce
# --------------------------------------

### Set background
echo -e "\e[40m\n\n"

### Velcome
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m"
echo -e "\e[93m Installation LegacyIce by KERNEL ULTRAS                  \e[38;5;46m"
echo -e "\e[93m----------------------------------------------------------\e[38;5;46m\n"

ORIG_PWD=$PWD

########################################################################################
### Copy APT preferences
########################################################################################
branch="stable"
echo -e "\e[93m Copy config pref $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos_prefs/$branch.pref /etc/apt/preferences.d/
branch="testing"
echo -e "\e[93m Copy config pref $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos_prefs/$branch.pref /etc/apt/preferences.d/
branch="unstable"
echo -e "\e[93m Copy config pref $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos_prefs/$branch.pref /etc/apt/preferences.d/
branch="experimental"
echo -e "\e[93m Copy config pref $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos_prefs/$branch.pref /etc/apt/preferences.d/

########################################################################################
### Copy APT lists
########################################################################################
branch="stable"
echo -e "\e[93m Copy sources.list $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos/$branch.list /etc/apt/sources.list.d/
branch="testing"
echo -e "\e[93m Copy sources.list $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos/$branch.list /etc/apt/sources.list.d/
branch="unstable"
echo -e "\e[93m Copy sources.list $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos/$branch.list /etc/apt/sources.list.d/
branch="experimental"
echo -e "\e[93m Copy sources.list $branch\e[38;5;46m\n"
sudo cp antiX-20/configs/repos/$branch.list /etc/apt/sources.list.d/

### END OF SCRIPT
echo -e "\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\e[93m##################################################\e[38;5;46m\n"
echo -e "\n"
echo -e "\e[93m All is done\e[38;5;46m\n"
echo -e "\e[0m\n"
