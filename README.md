## LegacyIce-antiX
Goal of the project is to return the traditional desktop systemd free

![IceWM desktop](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/screenshots/antix-main-qt.jpg)

##BETA STAGE

### Based on
* IceWM
* antiX-19
* Now based on GTK/Xfce

#### Script to convert antiX to LegacyIce
* Remove
    * JWM, FluxBox, herbstluftwm
    * leafpad
    * desktop-defaults-fluxbox-antix
    * desktop-defaults-hlwm-antix
    * desktop-defaults-jwm-antix
    * desktop-defaults-rox-antix
    * desktop-defaults-spacefm-antix
    * fluxbox-themes-antix
    * icewm-themes-antix
    * screenshot-antix
    * fluxbox
    * jwm
    * herbstluftwm
    * mousepad
    * desktop-session-antix
    * menu-icewm-antix
    * menu-manager-antix
    * wallpaper-antix
    * dillo

* Replace
    * connman -> network-manager
    * gftp-gtk -> filezilla
    * Slim -> LightDM
    * rox-filer -> thunar
    * file-roller -> xarchiver
    * menu-icewm-antix -> xde-menu

* Own dark theme for WM
* Unification QT theme with GTK
* Set panel (IceWM panel)
* Set applets
* Custom shutdown dialog window - YAD
* Custom start script
* Custom shutdown, reboot script
* Keyboard shortcuts for programs
* Keyboard shorcuts for sound volume, screenshot, etc.
* System status over OSD
* Same behavior of windows
* Workplace settings
* Taskbar applications (Quassel, Xchat, etc.)
* Install programs for communication, graphic, multimedia, develop and other
* Auto set winoptions
* Nice comments

### Install

(Needed antiX-19 installed)
antix download from here https://sourceforge.net/projects/antix-linux/files/Final/antiX-19/
Select **antiX-19.3_x64-full.iso** or **antiX-19.3_386-full.iso**

    wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce-antiX/master/antiX-20/legacyice.sh
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
