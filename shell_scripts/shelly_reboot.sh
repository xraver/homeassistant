#!/bin/bash

if [ -f /.dockerenv ]; then
	HASS_HOME="/config"
else
	HASS_HOME="../"
fi
USER=$(awk '/shelly_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
PASSWORD=$(awk '/shelly_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
SHELLY_ID=(
	shellyem.giorgioravera.it
	shellybulb.giorgioravera.it
	shellyplugs.giorgioravera.it
)

echo "Reboot Shelly Devices"

for i in "${SHELLY_ID[@]}"
do
	ALIVE=$(ping -c 1 $i |grep ttl)
	if [ ! -z "$ALIVE" ]; then
		STATUS=$(curl -s --user $USER:$PASSWORD http://$i/reboot | jq -r .ok)
		echo $i: $STATUS
	fi
done

echo "Done"
