## Settings

### Panel (dock)

For panel position to bottom change **TaskBarAtTop=1** in file ~/.icewm/preferences to **TaskBarAtTop=0**

### Applets

#### Network applet

Uncomment in file ~/.icewm/startup

nm-applet # Network applet

#### Battery status
Find in file ~/.icewm/preferences

TaskBarShowAPMStatus=0

Uncomment it and change to

TaskBarShowAPMStatus=1

#### Email applet (e.g. name@domain.com)
* MailBoxPath="imap://name%40domain.com:password@domain.com"
* MailCommand="firefox http://webmail.domain.com"
* Email ikon on panel TaskBarShowMailboxStatus=1

#### Sound applet

Uncomment **pasystray # Sound applet** (Pulse Audio) in file **~/.icewm/startup**

### Off compositor

Add # at the beginning of the line

compton &	# Compositor manager

in ~/.icewm/startup

(Comment it)

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
