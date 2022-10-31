#!/bin/bash

echo "#####################################"
echo Datenschmutz Linux Auto Backup install
echo "#####################################"

mkdir 

cd
sudo wget https://raw.githubusercontent.com/Datenschmutz/Linux-Backup/main/backup.sh -P /opt/backup/
sudo chmod +x backup.sh

clear
echo rClone Install - view Readme.md in Github

curl https://rclone.org/install.sh | sudo bash
rclone config
clear

read -p "rclone destination Name:" rclone
read -p "S3 Bucket Name" bucket

sed -i "s/RCLONE='fillme'/RCLONE='$rclone'/" /opt/backup/backup.sh
sed -i "s/bucket='fillme'/bucket='$bucket'/" /opt/backup/backup.sh

echo "####################################"
echo "## Thank you for using my script! ##"
echo "####################################"