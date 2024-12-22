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

echo "Check Shelly Firmware"

for i in "${SHELLY_ID[@]}"
do
	ALIVE=$(ping -c 1 $i |grep ttl)
	if [ ! -z "$ALIVE" ]; then
		HAS_UPDATE=$(curl -s --user $USER:$PASSWORD http://$i/status | jq -r .update.has_update)
		NEW=$(curl -s --user $USER:$PASSWORD http://$i/status | jq -r .update.new_version)
		OLD=$(curl -s --user $USER:$PASSWORD http://$i/status | jq -r .update.old_version)
		if [ $HAS_UPDATE == "true" ]; then
			echo $i: version: $OLD - new version: $NEW
		else
			echo $i: version: $OLD - new version: N/A
		fi
	fi
done

echo "Done"
