#!/bin/bash

echo "Changed directory to homeassistant home"
cd
echo "Activating python environment"
source bin/activate
echo "Upgrading homeassistant"
pip3 install --upgrade homeassistant > /var/log/homeassistant/upgrade.log
echo "Done"