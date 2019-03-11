#!/bin/bash

HOST=$(awk '/mqtt_host/ { print  $2 }' ../secrets.yaml)
USER=$(awk '/mqtt_user/ { print  $2 }' ../secrets.yaml)
PASSWORD=$(awk '/mqtt_password/ { print  $2 }' ../secrets.yaml)
SHELLY_ID=(
	55980F
	135454
	13572B
	559C49
)

echo "Upgrade Shelly Firmware"

for i in "${SHELLY_ID[@]}"
do
	echo mosquitto_pub -h $HOST -d -u $USER -P $PASSWORD -t shellies/shellyswitch-$i/command -m update_fw
done

echo "Done"
