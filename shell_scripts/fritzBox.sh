#!/bin/bash

# Parameters
if [ -f /.dockerenv ]; then
	HASS_HOME="/config"
else
	HASS_HOME="../"
fi

if [[ $1 == fritz ]]; then			# FRITZ!BOX 7590
	HOST=$(awk '/fritz_host/ { print  $2 }' $HASS_HOME/secrets.yaml)
	USERNAME=$(awk '/fritz_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
	PASSWORD=$(awk '/fritz_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
elif [[ $1 == ap1 ]]; then			# FRITZ!BOX 7530 AX
	HOST=$(awk '/ap1_host/ { print  $2 }' $HASS_HOME/secrets.yaml)
	USERNAME=$(awk '/ap1_user/ { print  $2 }' $HASS_HOME/secrets.yaml)
	PASSWORD=$(awk '/ap1_password/ { print  $2 }' $HASS_HOME/secrets.yaml)
fi
SCRIPT=$HASS_HOME/git_repos/FritzBoxShell/fritzBoxShell.sh

$SCRIPT --boxip $HOST --boxuser $USERNAME --boxpw $PASSWORD ${@:2}
