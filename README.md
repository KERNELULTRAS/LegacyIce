## LegacyIce-antiX
Goal of the project is to return the traditional desktop

![IceWM desktop](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/screenshots/antix-main-qt.jpg)

##BETA STAGE

### Based on
* IceWM
* antiX-19
* Now based on QT - GTK

#### Script to convert antiX to LegacyIce
* Without systemd
* Remove JWM, FluxBox
* LightDM instead of Slim
* Aplication menu generated with xde-menu
* Dynamic menu created after install or uninstall packages
* Nice dark theme for WM
* Unification QT theme with GTK
* Set panel (IceWM panel)
* Set applets
* Custom shutdown dialog window - YAD
* Set effect (transparency etc.) Compositor - Compton
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
Select **antiX-19.2_x64-full.iso** or **antiX-19.2_386-full.iso**

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

