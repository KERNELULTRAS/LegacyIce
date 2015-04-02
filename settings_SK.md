## Nastavenia

### Panel (dock)

Zmeniť pozíciu panela naspodok zmeň **TaskBarAtTop=1** v súbore ~/.icewm/preferences na **TaskBarAtTop=0**

### Ikonky v panely na spúšťanie aplikácií

Nastavenia sú v ~/.icewm/toolbar

Formát je: prog nazov_programu nazov_ikonky cesta_k_prgramu

napr.: prog FireFox firefox firefox

alebo: prog FireFox /usr/share/pixmaps/firefox.xpm /usr/bin/firefox

### Applety

#### Indikátor siete

Odkomentuj v súbore ~/.icewm/startup

nm-applet # Network applet

#### Ukazateľ stavu batérie
Nájdi v súbore ~/.icewm/preferences

TaskBarShowAPMStatus=0

Odkomentovať a zmeniť na

TaskBarShowAPMStatus=1

#### Ukazateľ nových emailov (napr. name@domain.com)
* MailBoxPath="imap://name%40domain.com:password@domain.com"
* MailCommand="firefox http://webmail.domain.com"
* Email ikon on panel TaskBarShowMailboxStatus=1

#### Zvukový applet (Pulse Audio)

Odkomentuj **pasystray # Sound applet** (Pulse Audio) v súbore **~/.icewm/startup**

### Vypnutie kompozitora

Pridaj # na začiatok riadka:

compton &	# Compositor manager

v súbore ~/.icewm/startup

(zakomentuj ho)

### Poznámky
* Klávesové skratky sú v súbore ~/.icewm/keys
* Základné nastavenia IceWM sú v súbore ~/.icewm/preferences
* Vybraná téma sa nachádza v súbore ~/.icewm/theme
* Témy sa nachádzajú v priečinku ~/.icewm/themes
* Programy (icons) na panely sa nachádzajú v súbore ~/.icewm/toolbar
* Menu je v súbore ~/.icewm/menu
* Nastavenie správania sa okien je v súbore ~/.icewm/winoptions
* Štartovací skript je v súbore ~/.icewm/startup
* Vlastné skripty sa nachádzajú v priečinku ~/.icewm/contrib
* Keď chceme prepísať hocijakú vlastnosť, tak v súbore ~/.icewm/prefoverride

