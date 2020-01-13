#!/bin/sh

set -e

HASS_HOME="/config"
IP=$(awk -F'"' '{print $2}' $HASS_HOME/bravia.conf)
PIN=$(awk -F'"' '{print $6}' $HASS_HOME/bravia.conf)
IRCC_CMD=$1

if [ "$1" = "" ]; then
  echo "Usage: $0 <IRCC_COMMAND>"
  exit 1
fi

cmd="<?xml version=\"1.0\"?><s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\" s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><s:Body><u:X_SendIRCC xmlns:u=\"urn:schemas-sony-com:service:IRCC:1\"><IRCCCode>$IRCC_CMD</IRCCCode></u:X_SendIRCC></s:Body></s:Envelope>"


code=$(curl -w "%{http_code}" --silent -XPOST http://$IP/sony/IRCC -d "$cmd" -H 'Content-Type: text/xml; charset=UTF-8' -H 'SOAPACTION: "urn:schemas-sony-com:service:IRCC:1#X_SendIRCC"' -H "X-Auth-PSK: $PIN" -o /dev/null )

if [ "$code" = "200" ]; then
  echo "✓"
else
  echo "Command failed (HTTP_CODE: $code, try running it in a console)"
  exit 1
fi
