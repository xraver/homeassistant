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
	shellyswitch-55980F
	shellyswitch25-6919BD
	shelly1-24D1EE
	shelly1-93B27D
	shellyswitch25-C45BBE6C38D0
	shellybulb-BC8610
	shellyem-B9E1A0
	shellyplug-s-7A31CB
)

echo "Upgrade Shelly Firmware"

for i in "${SHELLY_ID[@]}"
do
	mosquitto_pub -h $HOST -d -u $USER -P $PASSWORD -t shellies/$i/command -m update_fw
done

echo "Done"
