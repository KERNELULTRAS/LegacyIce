## LegacyIce
Goal of the project is to return the traditional desktop systemd free

![IceWM desktop](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/screenshots/antix-main-qt.jpg)

## BETA STAGE

### Based on
* IceWM
* antiX-19
* Now based on GTK/Xfce applications

#### Script to convert antiX to LegacyIce
Major changes

* Use only IceWM
* Own IceWM theme LegacyIce-Dark
* Ovn script for shutdown, restart ... (Ctrl+Alt+Delete)
* Instead fucking shit Connman uses NetworkManager
* Instead Slim use LightDM

### Make your own LegacyIce

(Needed antiX-19 installed)
antix download from here https://sourceforge.net/projects/antix-linux/files/Final/antiX-19/
Select **antiX-19.4_x64-full.iso** or **antiX-19.4_386-full.iso**

    git clone https://github.com/KERNELULTRAS/LegacyIce.git
    cd LegacyIce
    bash antiX-20/main.sh
    
    While the script is running, you will be asked to select Desktop manager. Select LightDM
    
    After script ending reboot system with command:
    sudo reboot

### Shortcuts

[Shortcuts](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/shortcuts_EN.md)

### Settings

[Settings](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/settings_EN.md)

### How to contribute
Send issue to https://github.com/KERNELULTRAS/LegacyIce-antiX/issues

GitHub [Contribute](https://github.com/KERNELULTRAS/LegacyIce-antiX/blob/master/development/instructions_for_git.md)

### Licence
[GNU GPLv2](http://www.gnu.org/licenses/gpl-2.0.html)
