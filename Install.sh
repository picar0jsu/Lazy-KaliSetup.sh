#!/bin/bash

# Configure SMB
echo "(+) Configuring SMB Shared Folder @ /share"
echo -e 'kali\nkali' | smbpasswd -a kali
mkdir /home/kali/share;chmod -R 777 /home/kali/share
systemctl start smbd;systemctl enable smbd;systemctl start nmbd;systemctl enable nmbd
echo "[share]
 path = /home/kali/share
 browseable = yes
 read only = no">>/etc/samba/smb.conf

# Mount Shared Folder
echo "(+) Mounting Shared Folder"
vmhgfs-fuse .host:/ /mnt/ -o subtype=vmhgfs-fuse,allow_other

# Add Mount into crontab
echo "(+) Adding mount script to Crontab"
echo "vmhgfs-fuse .host:/ /mnt/ -o subtype=vmhgfs-fuse,allow_other">/root/mount-shared-folders
echo '@reboot root /root/mount-shared-folders'>>/etc/crontab
chmod +x /root/mount-shared-folders

# Creating Symlink
echo "(+) Creating Symlink"
ln -s /mnt/SharedFolder/ /home/kali/Desktop/SharedFolder

# ZSH Aliases
echo "(+) Adding aliases to ZSH"
echo "source /home/kali/Desktop/SharedFolder/00-Customizations/.bash_aliases" >>/home/kali/.zshrc

# ZSH Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/kali/powerlevel10k
echo 'source /home/kali/powerlevel10k/powerlevel10k.zsh-theme' >>/home/kali/.zshrc

# Configure Apache
echo "(+) Configuring Apache Web Server"
systemctl start apache2;systemctl enable apache2;chmod -R 777 /var/www/html

# Configure Proxychains
echo "(+) Configuring Proxychains"
bash -c 'echo "socks4 127.0.0.1 1080" >> /etc/proxychains4.conf';sed -i '0,/proxy_dns/s//#proxy_dns/' /etc/proxychains4.conf

# Install APT Packages
echo "(+) Installing APT Packages"
apt update;apt install bloodhound crackmapexec gnome-terminal python3-pip xrdp -y #gnome-disks gnome-tweaks thunderbird

# Install GEM Packages
echo "(+) Installing GEM Packages"
gem install evil-winrm

# Install PIP Packages
echo "Twisted
txaio
typing-extensions
typing-inspect
tzlocal
u-msgpack-python
ufoLib2
ujson
unicodecsv
unicodedata2
Unidecode
urllib3
urwid
userpath
uvicorn
uvloop
vboxapi
venusian
wafw00f
wapiti3
watchdog
wcwidth
webargs
webencodings
WebOb
websocket-client
websockets
websockify
Werkzeug
wfuzz
wget
wheel
whois
wifite
winacl
wsaccel
wsproto
WTForms
xcffib
xdg
xlrd
XlsxWriter
xlutils
xlwt
xmltodict
yara-python
yarl
yaswfp
zc.lockfile
zipp
zlib-wrapper
zope.deprecation
zope.event
zope.interface">/tmp/requirements.txt
pip install -r /tmp/requirements.txt

# VSCode (https://code.visualstudio.com/download)

# Configure SSH
echo "(+) Enabling SSH Access"
systemctl enable ssh

# Configure RDP
echo "(+) Enabling RDP Access"
systemctl enable xrdp --now
/etc/init.d/xrdp start

# Enable nessus on startup
#systemctl enable nessusd

# Enable Bluetooh
#systemctl enable bluetooh

# Full upgrade + Headers
#apt full-upgrade -y

# Reboot
#reboot

#apt install linux-headers-$(uname -r)
