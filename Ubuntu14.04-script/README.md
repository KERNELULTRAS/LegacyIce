![IceWM desktop](../auxiliary_files/netbook.jpg)

### Run
wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/legacyice.sh

chmod +x legacyice.sh

./legacyice.sh

### Description
* Remove Unity and Ubuntu specific packages
* Dynamic menu created after install or uninstall package
* Fixed run QT5 applications and other patches
* Nice dark theme for WM
* Hacker GTK2/3 theme - HackStation
* Unification QT theme with GTK
* Set panel (IceWM panel)
* Set applets
* Custom shutdown dialog window - YAD
* Set effect (transparency etc.) Compositor - Compton
* Resolves user permissions for reboot and shutdown
* Custom start script
* Custom shutdown, reboot script
* Menu same as the Gnome2
* Keyboard shortcuts for programs
* Keyboard shorcuts to sound volume, screenshot, etc.
* System status over OSD
* Same behavior of windows
* Workplaces settings
* Taskbar applications (Pidgin, Xchat, etc.)
* Remove unnecessary programs, spyware, bloatware, etc.
* Config files for Geany
* Install programs for communication, graphic, multimedia, develop and other
* Nice comments

### Notebooks, NetBooks
#### Network applet for connect to Wifi ...
Add at end file ~/.icewm/startup

nm-applet # Network applet

#### Battery status
Find in file ~/.icewm/preferences

TaskBarShowAPMStatus=0

Uncomment it and change to

TaskBarShowAPMStatus=1

#### Slow graphics card
Add # at the beginning of the line

compton &	# Compositor manager

in ~/.icewm/startup

(Comment it)
### Notes
* Key shortcut located in file ~/.icewm/keys
* Selected theme located in file ~/.icewm/theme
* Themes located in directory ~/.icewm/themes
* Programs (icons) on panel located in file ~/.icewm/toolbar
* Starup script located in file ~/.icewm/startup
* Custom scripts located in directory ~/.icewm/contrib

#### Disable compositor
Add # at the beginning of the line

compton &	# Compositor manager

in ~/.icewm/startup

(Comment it)
#### Set email applet
* MailBoxPath="imap://name%40domain.com:password@domain.com"
* MailCommand="firefox http://webmail.domain.com"
* Off email ikon TaskBarShowMailboxStatus=0

#### Panel (dock) at the top of the screen
Uncomment TaskBarAtTop=0 and change it to TaskBarAtTop=1
