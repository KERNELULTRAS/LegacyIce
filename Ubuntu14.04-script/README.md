![IceWM desktop](../auxiliary_files/netbook.jpg)

### Run
wget https://raw.githubusercontent.com/KERNELULTRAS/LegacyIce/master/Ubuntu14.04-script/legacyice.sh

chmod +x legacyice.sh

./legacyice.sh

### Description
* Remove Unity and Ubuntu specific packages
* Dynamic menu create after install or uninstall package
* Fixed run QT5 applications and other patches
* Nice dark theme for WM
* Hacker GTK2/3 theme - HackStation
* Unification QT theme with GTK
* Set panel (IceWM panel)
* Set applets
* Custom sthutdown dialog window - YAD
* Set efect (opacity etc.) Compositor - Compton
* Resolves user permissions for reboot and shutdown
* Custom start script
* Custom shutdown, reboot script
* Menu as the Gnome2
* Keyboard shortcut for programs
* Keyboard shorcut to sound volume, screenshot ...
* System status over OSD
* The behavior of windows
* Workplaces settings
* Taskbar applications (Pidgin, Xchat ...)
* Remove unnecessary programs, spyware, bloatware ...
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
* Key shortcut is in file ~/.icewm/keys
* Selected theme is in file ~/.icewm/theme
* Themes is in directory ~/.icewm/themes
* Programs (icons) on panel is in file ~/.icewm/toolbar
* Starup script is in file ~/.icewm/startup
* Custom scripts in directory ~/.icewm/contrib

#### Disable compositor
Add # at the beginning of the line

compton &	# Compositor manager

in ~/.icewm/startup

(Comment it)
#### Set email applet
* MailBoxPath="imap://name%40domain.com:password@domain.com"
* MailCommand="firefox http://webmail.domain.com"
* Off email ikon TaskBarShowMailboxStatus=0

#### Panel (dock) at top of the screen
Uncomment TaskBarAtTop=0 and change it to TaskBarAtTop=1
