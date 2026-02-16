#!/bin/bash

# Title: Minecraft Server Backup

# Author: EthanK14

# Desc. 
# This is a script to automate backups of a minecraft server. Only copies and restores world 
# data to protect againts save corruption. 

WORLD_PATH="~/minecraft/world"
WORLD_BACKUP="~/backups"

# get currentdate for backup file name
NOW="$(date -I)"

# stop the server before copying world data
screens -S minecraft -X stuff "stop^M"

cp -r $WORLD_PATH $WORLD_BACKUP/world_$NOW

# restart the server after backup is complete
screens -S minecraft -X stuff "java -Xmx4G -Xms4G -jar server.jar nogui^M"

# remove old backups when there are more than 2
BACKUP_COUNT=$(ls -1 $WORLD_BACKUP | wc -l)

if [ $BACKUP_COUNT -gt 2 ]; then
    OLDEST_BACKUP=$(ls -1t $WORLD_BACKUP | tail -n 1)
    rm -rf "$WORLD_BACKUP/$OLDEST_BACKUP"
fi


