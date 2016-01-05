## Settings

### Icons on desktop

You need uncomment in file ~/.icewm/startup

line

spacefm --desktop

### Panel (dock)

For panel position to bottom change **TaskBarAtTop=1** in file ~/.icewm/preferences to **TaskBarAtTop=0**

### Shortcuts icons on toolbar

Located in file ~/.icewm/toolbar

Format: prog program_name icon_name path_to_prgram

e.g.: prog Iceweasel iceweasel iceweasel

or: prog Iceweasel /usr/share/icons/hicolor/48x48/apps/iceweasel.png /usr/bin/iceweasel

### Applets

#### Hide network applet

Comment in file ~/.icewm/startup

wicd-gtk -t & # Network applet

#### Battery status
Find in file ~/.icewm/preferences

TaskBarShowAPMStatus=0

Uncomment it and change to

TaskBarShowAPMStatus=1

#### Email applet (e.g. name@domain.com)
Change in file ~/.icewm/preferences

* MailBoxPath="imap://name%40domain.com:password@domain.com"
* MailCommand="Iceweasel http://webmail.domain.com"

Email icon on panel
* TaskBarShowMailboxStatus=1

#### Hide sound applet

Comment **pasystray # Sound applet** (Pulse Audio) in file **~/.icewm/startup**

### Compositor enable

Uncomment in file ~/.icewm/startup

compton &	# Compositor manager

### Notes
* Key shortcut located in file ~/.icewm/keys
* Controls the general behavior of IceWM, file ~/.icewm/preferences
* Selected theme located in file ~/.icewm/theme
* Themes located in directory ~/.icewm/themes
* Programs (icons) on panel located in file ~/.icewm/toolbar
* Menu customize in file ~/.icewm/menu
* Controls the behavior of windows, file ~/.icewm/winoptions
* Starup script located in file ~/.icewm/startup
* Custom scripts located in directory ~/.icewm/contrib
* Override any preference, file ~/.icewm/prefoverride
