#!/bin/bash

HASS_HOME="/var/lib/homeassistant/.homeassistant"
USER=$(awk '/shelly_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
PASSWORD=$(awk '/shelly_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
SHELLY_ID=(
	shelly1.giorgioravera.it
	shelly2.giorgioravera.it
	shelly3.giorgioravera.it
	shelly4.giorgioravera.it
	shelly5.giorgioravera.it
	shelly6.giorgioravera.it
	shelly7.giorgioravera.it
	shelly8.giorgioravera.it
	shelly9.giorgioravera.it
	shelly10.giorgioravera.it
	shellybulb.giorgioravera.it
	shellyem.giorgioravera.it
	shellydw.giorgioravera.it
	shellyplugs.giorgioravera.it
)

echo "Reboot Shelly Devices"

for i in "${SHELLY_ID[@]}"
do
	ALIVE=$(ping -c 1 $i |grep ttl)
	if [ ! -z "$ALIVE" ]; then
		STATUS=$(curl -s --user $USER:$PASSWORD http://$i/reboot | sed -e "s/{"ok"}://g")
		echo $STATUS
	fi
done

echo "Done"