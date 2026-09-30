#!/bin/bash

###############################################################################################
# This file used to configure an ubuntu terminal. Lorsqu'il sera terminer, il pourra être 
# utiliser avec la commande d'installation ubuntu pour WSL avec la technologie cross platform
# For the moment the file is only usable after installation. when the project will be finished
# it will be possible to lauch during the installation as an option. Cela evitera d'avoir à manipuler 
# les fichiers après l'installation ubuntu. Pour le moment il est seullement utilisable après
# l'installation avec le chemin reltif suivi du nom du fichier. 
# Exemple : ./script.sh
###############################################################################################

# start as super user
sudo su root

# variable
declare subs
subs="30 *   * * * root		cp /mnt/c/Users/roamy/Temp/* /mnt/f/log/ && rm -rf /mnt/c/Users/roamy/Temp/* /etc/crontab"

# had to be root to use the following commands
systemctl enable systemd-networkd

# apt database update
apt update 1>/dev/null 2>/dev/null && apt upgrade 1>/dev/null 2>/dev/null
apt install tree plocate gitk -y

cd /
clear

# edit of the terminal properties
tee -a /etc/bash.bashrc 1>/dev/null << EOF
if ! -e /mnt/f; then
	mkdir /mnt/f
	chmod -R 700 /mnt/f
fi
EOF

tee -a /home/roamy/.bashrc 1>/dev/null << EOF
if ! -e /mnt/f; then
	mkdir /mnt/f
	chmod -R 700 /mnt/f
fi
EOF

tee -a /home/root/.bashrc 1>/dev/null << EOF
if ! -e /mnt/f; then
	mkdir /mnt/f
	chmod -R 700 /mnt/f
fi
EOF

# acces to the an usb key
mkdir 
mount -t drvfs F: /mnt/f

# edit of files properties
sed -i -e "s/# set linenumbers/ set linenumbers/" /etc/nanorc
#grep -o "#" /etc/crontab | tail -1 | sed -i -e "s/#/$subs/"  /etc/crontab
#grep -o "#force_color_prompt" /home/roamy/.bashrc | sed -e -i "s/#//" /home/roamy/.bashrc
#grep -o "#force_color_prompt" /root/.bashrc | sed -e -t "s/#//" /root/.bashrc


