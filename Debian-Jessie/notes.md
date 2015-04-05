### Install wifi driver for Acer Aspire One (Broadcom BCM4313)

add to sources.list

deb http://http.debian.net/debian/ squeeze main contrib non-free

apt-get update && apt-get install firmware-brcm80211

modprobe -r brcmsmac

modprobe brcmsmac
