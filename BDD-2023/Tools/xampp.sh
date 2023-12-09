#!/bin/bash



PASSWD="$(zenity --password --title=Authentication)\n"


echo $PASSWD | sudo -S /opt/lampp/lampp start
sudo systemctl stop mysql

