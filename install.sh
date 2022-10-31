#!/bin/bash

echo "#####################################"
echo Datenschmutz Linux Auto Backup install
echo "#####################################"

cd
sudo wget https://raw.githubusercontent.com/Datenschmutz/Linux-Backup/main/backup.sh
sudo chmod +x backup.sh

mkdir /opt/backup/

clear
echo rClone Install - view Readme.md in Github

curl https://rclone.org/install.sh | sudo bash
rclone config
clear

read -p "rclone destination Name:" rclone
read -p "Enable Advanced Backup Options? (yes/no): " AdvBck
read -p "Enable Moonraker History (print stats)? (yes/no): " hist
read -p "Enable Extras Backup (.py Scripts/ Ercf...) (yes/no): " extr
read -p "Enable Log Backup (yes/no): " log
read -p "Enable Moonraker Backup (yes/no): " moonrake
read -p "Enable G-Code File Backup. Warning: Will take up more space over time (yes/no): " gcod

sed -i "s/RCLONE='fillme'/RCLONE='$rclone'/" /home/$USER/backup.sh
sed -i "s/KLIPPER='no'/KLIPPER='$klipp'/" /home/$USER/backup.sh
sed -i "s/HISTORY='no'/HISTORY='$hist'/" /home/$USER/backup.sh
sed -i "s/EXTRAS='no'/EXTRAS='$extr'/" /home/$USER/backup.sh
sed -i "s/LOGS='no'/LOGS='$log'/" /home/$USER/backup.sh
sed -i "s/MOONRAKER='no'/MOONRAKER='$moonrake'/" /home/$USER/backup.sh
sed -i "s/GCODE='no'/GCODE='$gcod'/" /home/$USER/backup.sh


echo "####################################"
echo "## Thank you for using my script, ##"
echo "####################################"