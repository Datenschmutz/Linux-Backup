#!/bin/bash
BIRed='\033[1;91m'
clear='\033[0m'
# Datenschmutz Auto-Backup
# On Every reboot, selected files will be automatically backuped into timestamped folders.

###############
## EDIT ZONE ##
###############

# you should understand how to enable and disable it manually...

#Replace with the name of your rClone destination
rclone="fillme"

#Wanted S3 Bucket name
bucket='fillme'

#
TBD='no'

#
TBD='no'

#
TBD='no'

#
TBD='no'

#
TBD='no'

#
TBD='no'

######################
## DON'T EDIT ZONE ##
######################

#Config check
if [ $RCLONE = "fillme"  ]
then
echo -e ${BIRed}rClone config argument is at default value please configure "backup.sh" via the "install.sh" script{clear}. && exit
fi

if [ $bucket = "fillme"  ]
then
echo -e ${BIRed}Bucket name config argument is at default value please configure "backup.sh" via the "install.sh" script{clear}. && exit
fi

#Copy selected files/folders
CURRENTDATE=$(date)
BCKUPPATH=/home/$USER/autobackup

if [ $CONFIG = "yes" ]
then
  cp -r /home/$USERNAME/klipper_config "$BCKUPPATH"
fi


if [ $KLIPPER = "yes"  ]
then
  cp -r /home/$USERNAME/klipper "$BCKUPPATH"
fi

if [ $EXTRAS = "yes" ]
then
  cp -r /home/$USERNAME/klipper/klippy/extas "$BCKUPPATH"
fi

if [ $LOGS = "yes" ]
then
  cp -r /home/$USERNAME/klipper_logs "$BCKUPPATH"

fi

if [ $MOONRAKER = "yes" ]
then
  cp -r /home/$USERNAME/moon* "$BCKUPPATH"

fi

if [ $GCODES = "yes" ]
then
  cp -r /home/$USERNAME/gcode_files "$BCKUPPATH"

fi

if [ $HISTORY = "yes" ]
then
  cp -r /home/$USERNAME/.moonraker_database "$BCKUPPATH"

fi

#Compresses copied files into a tar.gz archive
cd "$BCKUPPATH" && tar -cvzf Voron-Backup-$(date +%d.%m.%Y).tar.gz --directory="$BCKUPPATH" .

#rClone command to move tar.gz archive to S3 destination directory
/usr/bin/rclone move -P --update --verbose --transfers 30 --log-file=/var/log/upload.log "$BCKUPPATH" "s3-eu2:backup/"

###############################
## CUSTOM BACKUP FOLDER ZONE ##
###############################

#Example: sudo cp -r /YOUR/FOLDER "$BCKUPPATH"









#Remixed by Datenschmutz based on Takuya Script ;)
