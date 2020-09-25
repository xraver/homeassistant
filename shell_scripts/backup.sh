#!/bin/bash

FILENAME=homeassistant_$(date +"%Y%m%d").tar.bz2

docker container stop homeassistant
cd ../../
tar cfvj homeassistant/backups/$FILENAME --exclude='backups' --exclude='tts/*' --exclude='home-assistant.log' --exclude='home-assistant_v2.db' homeassistant
#docker container start homeassistant
cd -
