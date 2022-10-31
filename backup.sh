#!/bin/bash
BIRed='\033[1;91m'
clear='\033[0m'
# Datenschmutz Auto-Backup

###############
## EDIT ZONE ##
###############

#Replace with the name of your rClone destination
rclone="fillme"

#Wanted S3 Bucket name
bucket='fillme'

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

#Copy selected files/folders and compresses them into a tar.gz archive
BCKUPPATH=/opt/backup

cd "$BCKUPPATH" && tar -cvzf backup-$(date +%d.%m.%Y).tar.gz --directory=/ --exclude=lost+found --exclude=dev/* --exclude=proc/* --exclude=run/* --exclude=sys/* --exclude=tmp/* --exclude=mnt/* --exclude=media/* --exclude="$BCKUPPATH"/* .

#rClone command to move tar.gz archive to S3 destination directory
/usr/bin/rclone move -P --update --verbose --transfers 30 --log-file=/var/log/upload.log "$BCKUPPATH" ""$rclone":"$bucket"/"


#Remixed by Datenschmutz based on Takuya Script ;)