#!/bin/bash

docker container stop homeassistant
docker container rm homeassistant
cd ..
sudo rm -fr \
  .HA_VERSION \
  .mercedesme-token-cache \
  .storage \
  .uuid \
  custom_components \
  deps \
  home-assistant.log \
  home-assistant_v2.db* \
  html5_push_registrations.conf \
  themes \
  tts \
  www/community 
sudo cp -a git_repos/hacs/custom_components/hacs/ custom_components/
docker-compose -f /srv/docker-compose/homeassistant/docker-compose.yaml up -d
cd -
