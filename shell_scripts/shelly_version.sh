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
	shelly7.giorgioravera.it
	shellybulb.giorgioravera.it
	shellyem.giorgioravera.it
	shellyplugs.giorgioravera.it
)

echo "Check Shelly Firmware"

for i in "${SHELLY_ID[@]}"
do
	ALIVE=$(ping -c 1 $i |grep ttl)
	if [ ! -z "$ALIVE" ]; then
		VERSION=$(curl -s --user $USER:$PASSWORD http://$i/status | sed -e "s/},/}\n/g" |grep \"update\" | sed -e "s/,/\n/g" | sed -e "s/:/:\t/g" | awk '/has_update/ { print $2 }')
		NEW=$(curl -s --user $USER:$PASSWORD http://$i/status | sed -e "s/},/}\n/g" |grep \"update\" | sed -e "s/,/\n/g" | sed -e "s/:/:\t/g" | awk '/new_version/ { print $2 }')
		OLD=$(curl -s --user $USER:$PASSWORD http://$i/status | sed -e "s/},/}\n/g" |grep \"update\" | sed -e "s/,/\n/g" | sed -e "s/:/:\t/g" | awk '/old_version/ { print $2 }')
		echo $i: $VERSION - $OLD - $NEW
	fi
done

echo "Done"
