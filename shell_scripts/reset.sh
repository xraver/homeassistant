#!/bin/bash
KEEP_ELEMENT=(.google_maps_location_sharing.cookies.*
              .mercedesme-token-cache
              .vscode/
              backups/
              credentials/
              custom_components/
              git_repos/
              html5_push_registrations.conf
              known_devices.yaml
              secrets.yaml
              themes/
)
TMP_FOLDER="/tmp/homeassistant"

cd ..
##########################
# Stop Docker            #
##########################
docker container stop homeassistant
docker container rm homeassistant

##########################
# Backup file not in GIT #
##########################
mkdir $TMP_FOLDER
for f in "${KEEP_ELEMENT[@]}"
do
    cp -a $f $TMP_FOLDER/
done

##########################
# Clean GIT folder       #
##########################
git clean -f -x -d

##########################
# Revert file not in GIT #
##########################
for f in "${KEEP_ELEMENT[@]}"
do
    mv $TMP_FOLDER/$f .
done
rm -fr $TMP_FOLDER

docker-compose -f /srv/docker-compose/homeassistant/docker-compose.yaml up -d
cd -
