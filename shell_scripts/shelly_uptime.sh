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
	shelly1.giorgioravera.it
	shelly2.giorgioravera.it
	shelly5.giorgioravera.it
	shelly6.giorgioravera.it
	shelly8.giorgioravera.it
	shellybulb.giorgioravera.it
	shellyem-old.giorgioravera.it
	shellyplugs.giorgioravera.it
)

echo "Check Shelly Uptime"

for i in "${SHELLY_ID[@]}"
do
	ALIVE=$(ping -c 1 $i |grep ttl)
	if [ ! -z "$ALIVE" ]; then
		UPTIME=$(curl -s --user $USER:$PASSWORD http://$i/status | jq -r .uptime)
		echo $i: $UPTIME
	fi
done

echo "Done"
