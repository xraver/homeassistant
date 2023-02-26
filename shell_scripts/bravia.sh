#!/bin/sh

# Parameters
if [ -f /.dockerenv ]; then
	HASS_HOME="/config"
else
	HASS_HOME="../"
fi
HOST=$(awk -F'"' '{print $2}' $HASS_HOME/credentials/bravia.conf)
PIN=$(awk -F'"' '{print $6}' $HASS_HOME/credentials/bravia.conf)
SCRIPT=$HASS_HOME/git_repos/bravia-auth-and-remote/send_command.sh

$SCRIPT $HOST $PIN $@