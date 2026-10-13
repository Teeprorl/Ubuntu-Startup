#!/bin/bash

chargement() {
	if(( charge == 100)); then
		echo -e "\rTéléchargement ${charge}%"
		exit
	fi
	charge=$((charge + RANDOM % 12))
	echo -e "\rTéléchargement ${charge}%"
}


# variable
declare subs
subs="30 *    * * * root		cp \/mnt\/c\/Users\/roamy\/Temp\/* \/mnt\/f\/log\/ && rm -rf \/mnt\/c\/Users\/roamy\/Temp\/*"

# has to be root to use the following commented commands
#systemctl enable systemd-networkd

chargement #download progress statement

# apt database update
apt update -y 1>/dev/null 2>/dev/null && apt upgrade -y 1>/dev/null 2>/dev/null

chargement #download progress statement

# apt package installation
apt install tree plocate gitk gh apt-utils -y 1>/dev/null 2>/dev/null

cd /
clear

chargement #donwload progress statement

# acces to the an usb key
mkdir -p -m 755 /mnt/f
mount -t drvfs F: /mnt/f

# edit of files properties
sed -i -e "s/# set linenumbers/ set linenumbers/" /etc/nanorc
sed -i -e "s/^#$/$subs/" /etc/crontab
sed -i -e "s/#force_color_prompt/ force_color_prompt/" /home/roamy/.bashrc
sed -i -e "s/#force_color_prompt/ force_color_prompt/" /root/.bashrc

charge=100

chargement #download progress statement
