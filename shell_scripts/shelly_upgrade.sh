#!/bin/bash

HASS_HOME="/var/lib/homeassistant/.homeassistant"
HOST=$(awk '/mqtt_host/ { print  $2 }' $HASS_HOME/secrets.yaml)
USER=$(awk '/mqtt_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
PASSWORD=$(awk '/mqtt_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
SHELLY_ID=(
	shellyswitch-55980F
	shellyswitch-135454
	shellyswitch-13572B
	shellyswitch-559C49
	shelly1-24D1EE
	shelly1-93B27D
	shelly1-C426F9
	shellyswitch25-7457D8
	shelly1-59E18C
	shelly1-24D1A8
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
