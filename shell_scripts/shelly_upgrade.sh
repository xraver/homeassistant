#!/bin/bash

HASS_HOME="/config"
HOST=$(awk '/mqtt_host/ { print  $2 }' $HASS_HOME/secrets.yaml)
USER=$(awk '/mqtt_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
PASSWORD=$(awk '/mqtt_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
SHELLY_ID=(
	shellyswitch-55980F
	shellyswitch25-6919BD
	shellyswitch-13572B
	shellyswitch-559C49
	shelly1-24D1EE
	shelly1-93B27D
	shellydimmer-D3EA58
	shellyswitch25-7457D8
	shelly1-59E18C
	shellydimmer-D46CF2
	shelly1-C423C8
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
