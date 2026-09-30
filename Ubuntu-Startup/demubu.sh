#!/bin/bash

#####################################################################################################################
# This file is used to configure an ubuntu terminal. La dernière version de ce projet sera utilsable lors de 
# l'installation du subsystem ubuntu. Pour l`instant seul le fichier demubu.sh est utilisable avec le `dot slash`
# Exemple ./demubu.sh
#####################################################################################################################

# variable
declare subs
subs="30 *    * * * root		cp \/mnt\/c\/Users\/roamy\/Temp\/* \/mnt\/f\/log\/ && rm -rf \/mnt\/c\/Users\/roamy\/Temp\/*"

# had to be root to use the following commands
systemctl enable systemd-networkd

# apt database update
apt update -y 1>/dev/null 2>/dev/null && apt upgrade -y 2>/dev/null 2>/dev/null
apt install tree plocate gitk -y 1>/dev/null 2>/dev/null

cd /
clear

# acces to the an usb key
mkdir -p -m 755 /mnt/f
mount -t drvfs F: /mnt/f

# edit of files properties
sed -i -e "s/# set linenumbers/ set linenumbers/" /etc/nanorc
sed -i -e "s/^#$/$subs/" /etc/crontab
sed -i -e "s/#force_color_prompt/ force_color_prompt/" /home/roamy/.bashrc
sed -i -e "s/#force_color_prompt/ force_color_prompt/" /root/.bashrc
