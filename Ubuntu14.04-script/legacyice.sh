# (Only GTK and QT application)
# (In alphabetical order)

### INSTALL PROGRAMS

### Dev programs
apt-get --yes install filezilla geany ghex scribes

### Graphics programs
apt-get --yes install blender dia freecad gimp inkscape librecad meshlab pycam tupi pstoedit

### Multimedia programs
apt-get --yes install brasero pavucontrol vlc

### Office
apt-get --yes install libreoffice

### Communication programs
apt-get --yes install ekiga mumble pidgin xchat

### Internet programs
apt-get --yes install firefox putty remmina

### File managers
apt-get --yes install spacefm (?)

### Virtualization programs
# apt-get --yes install kvm qemu virt-manager

### Emulators (wine not is emulator :)
apt-get --yes install wine

### Tools
apt-get --yes install curl elinks gdebi git gnome-terminal gparted htop keepassx mc nmap openjdk-6-jdk openjdk-7-jdk openjdk-6-jre openjdk-7-jre openssh openvpn scrot synaptic wget whois

### Local webserver
apt-get --yes install mysql-server-core-5.5 mysql-server-5.5 libaio1 mysql-client-core-5.5 apache2-mpm-prefork libaprutil1 libapache2-mod-php5 php5-mysql php5-common  libaprutil1-dbd-sqlite3 php5-readline mysql-client-5.5 libhtml-template-perl libterm-readkey-perl libaprutil1-ldap mysql-common php5-cli libmysqlclient18 apache2-data php5-json libapr1 apache2 mysql-server apache2-bin libdbd-mysql-perl libdbi-perl

### Theme
apt-get --yes install hackstation-theme

### REMOVE UNNECESSARY PACKAGES
apt-get --yes remove ubuntu-desktop compiz-gnome ibus ibus-gtk ibus-gtk3 account-plugin-aim account-plugin-jabber account-plugin-salut account-plugin-yahoo empathy empathy-common telepathy-gabble telepathy-salut mcp-account-manager-uoa nautilus-sendto-empathy

### Make directory for user specific programs
mkdir Programs

### Add bookmarks for Programs to Gnome3 (Nautilus) ...
echo "file://$HOME/Programs" >> $HOME/.config/gtk-3.0/bookmarks

### Make directory for games trigger
mkdir Games

### Add bookmarks for Games to Gnome3 (Nautilus) ...
echo "file://$HOME/Games" >> $HOME/.config/gtk-3.0/bookmarks

### Set Gnome2 theme

echo '# Any customization should be done in ~/.gtkrc-2.0

gtk-theme-name="HackStation"
gtk-icon-theme-name="Neu"
gtk-font-name="Sans 10"
gtk-cursor-theme-name="DMZ-White"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintslight"
gtk-xft-rgba="rgb"
gtk-color-scheme="tooltip_fg_color:#000000\nbase_color:#2E3436\nselected_fg_color:#7AA3CC\ntext_color:#D3D7CF\nbg_color:#555753\ntooltip_bg_color:#EDDE5C\nselected_bg_color:#3F403D\nfg_color:#E6E6E6\n"
include "/home/mario/.gtkrc-2.0.mine"' > $HOME/.gtkrc

### Set Gnome3 theme

echo "[Settings] 
gtk-theme-name=HackStation
gtk-icon-theme-name=Neu
gtk-font-name=Sans 10
gtk-cursor-theme-name=DMZ-White
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
gtk-color-scheme=tooltip_fg_color:#000000\nbase_color:#2E3436\nselected_fg_color:#7AA3CC\ntext_color:#D3D7CF\nbg_color:#555753\ntooltip_bg_color:#EDDE5C\nselected_bg_color:#3F403D\nfg_color:#E6E6E6\n" > $HOME/.config/gtk-3.0/settings.ini

