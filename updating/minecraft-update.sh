#! bin/bash

# Title: Minecraft Server Update
# Author: EthanK14

# Desc.
# This script is used to automate the process of updating a minecraft server. It will stop the
# server, backup the world data, update the server jar, and then restart the server.

# Define variables for paths
SERVER_PATH="~/minecraft"
BACKUP_PATH="~/backups"
GEYSER_JAR="geyser.jar"
FLOODGATE_JAR="floodgate.jar"

# Backup the world data before updating
./minecraft-backup.sh

# Stop the server before updating
screens -S minecraft -X stuff "stop^M"

# update process
# remove old files 
rm -rf "$SERVER_PATH/$GEYSER_JAR"
rm -rf "$SERVER_PATH/$FLOODGATE_JAR"

# gather geyser spigot server jar from spigot website
wget "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot" -o "$SERVER_PATH/geyser-spigot.jar"
# gather floodgate spigot server jar from spigot website
wget "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot" -o "$SERVER_PATH/floodgate-spigot.jar"


# restart the server after update is complete
screens -S minecraft -X stuff "java -Xmx4G -Xms4G -jar server.jar nogui^M"