## LegacyIce-antiX
Goal of the project is to return the traditional desktop

![IceWM desktop](https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/screenshots/LegacyIce.jpg)

##BETA STAGE

### Based on
* IceWM
* antiX-16
* Now based on GTK+ 2 (3)

### Aim

#### Repository for last IceWM
* Make latest package of [IceWM](https://github.com/bbidulock/icewm)

#### Script to convert antiX to LegacyIce
* Without systemd
* Remove JWM, FluxBox, Herbstluftwm and settings
* Aplication menu generated with icewm-menu-fdo
* Dynamic menu created after install or uninstall packages
* Fixed run QT5 applications and other patches
* Nice dark theme for WM
* Nice dark GTK2/3 theme - MediterraneanDarkest
* Unification QT theme with GTK
* Set panel (IceWM panel)
* Set applets
* Custom shutdown dialog window - YAD
* Set effect (transparency etc.) Compositor - Compton
* Resolves user permissions for pn-suspend and pm-hybernate
* Custom start script
* Custom shutdown, reboot script
* Keyboard shortcuts for programs
* Keyboard shorcuts for sound volume, screenshot, etc.
* System status over OSD
* Same behavior of windows
* Workplace settings
* Taskbar applications (Pidgin, Xchat, etc.)
* Config files for Geany
* Install programs for communication, graphic, multimedia, develop and other
* Auto set winoptions
* Nice comments

### Install

(Needed antiX-15 installed)
antix download from here http://sourceforge.net/projects/antix-linux/files/Final/MX-krete/
Select **antiX-15-V_x64-full.iso** or **antiX-15-V_386-full.iso**

    wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-15/legacyice.sh
    chmod +x legacyice.sh
    ./legacyice.sh

### Shortcuts

[Shortcuts](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/shortcuts_EN.md)

### Settings

[Settings](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/settings_EN.md)

### How to contribute
Send issue to https://github.com/KERNELULTRAS/LegacyIce-antiX/issues

GitHub [Contribute](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/development/instructions_for_git.md)

### TODO
Network Manager without systemd dependency

### Licence
[GNU GPLv2](http://www.gnu.org/licenses/gpl-2.0.html)

