#!/bin/bash

HASS_HOME="/config"
LOG_FILE="$HASS_HOME/home-assistant_upgrade.log"

echo "Changed directory to homeassistant home"
cd $HASS_HOME
#echo "Activating python environment"
#source bin/activate
echo "Starting upgrading homeassistant"
pip3 install --upgrade homeassistant 2>&1 | tee $LOG_FILE
echo "Done"
