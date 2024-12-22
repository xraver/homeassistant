#!/bin/bash

if [ -f /.dockerenv ]; then
	HASS_HOME="/config"
else
	HASS_HOME="../"
fi
HOST=$(awk '/mqtt_host/ { print  $2 }' $HASS_HOME/secrets.yaml)
USER=$(awk '/mqtt_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
PASSWORD=$(awk '/mqtt_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
SHELLY_ID=(
	shellyem-B9F0D0
	shellybulb-BC8610
	shellyplug-s-7A31CB
)

echo "Upgrade Shelly Firmware"

for i in "${SHELLY_ID[@]}"
do
	mosquitto_pub -h $HOST -d -u $USER -P $PASSWORD -t shellies/$i/command -m update_fw
done

echo "Done"
