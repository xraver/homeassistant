# Home Assistant Configuration
[![Check Status][check-status-img]][check-status-url]
[![Last Commit][last-commit-img]][last-commit-url]
[![License Status][license-img]][license-url]
[![BuyMeCoffee][buymecoffee-img]][buymecoffee-url]

This repository contains the [Home Assistant](https://www.home-assistant.io/) configuration for my house: Casa Ravera-Testa.

## Running System
Home Assistant is running in a container created from the official [Docker Image](https://hub.docker.com/r/homeassistant/home-assistant).
Docker is running in a Virtual Machine based on [Linux Debian](https://www.debian.org/).
My server is an Intel NUC (NUC10i5FNH) with [Proxmox Virtual Environment](https://www.proxmox.com/en/).

## Official Component Used
* Amazon Alexa
* BTcino/Legrand relays
* Canon Printer (TR8550)
* CO2 Signal
* Google (Chromecast, Google Home Mini)
* HomeKit
* Mercedes Me (Mercedes-Benz A200d)
* Netatmo Thermostatic valves
* LG ThinQ Washing Machine (LG F2WV9S8P2E)
* LG WebOS TV (LG 28TL510S-PZ)
* Mitsubishi Air Conditioning (MSZ-LN25VG2V, MSZ-LN35VG2V)
* Proxmox
* QNAP NAS (TS-228A)
* Shelly (Shelly1, Shelly2, Shelly2.5, ShellyEM, Shelly Dimmer)
* Sony Android TV (KD-55XF8596)
* Xiaomi (MiJia door & window contact sensor, MiJia temperature & humidity sensor)

## Custom Component Used (included in HACS)
The following integration are part of HACS system. Install HACS first:
* [HACS](https://github.com/hacs/integration)
### Integrations
* [browser_mod](https://github.com/thomasloven/hass-browser_mod)
* [Monitor Docker](https://github.com/ualex73/monitor_docker)
* [MercedeME 2020](https://github.com/ReneNulschDE/mbapi2020)
* [pfSense integration for Home Assistant](https://github.com/travisghansen/hass-pfsense) (not currently used)
* [Scheduler Component](https://github.com/nielsfaber/scheduler-component) (not currently used)
### Frontend
* [auto-entities](https://github.com/thomasloven/lovelace-auto-entities)
* [Bar Card](https://github.com/custom-cards/bar-card)
* [Battery State Card](https://github.com/maxwroc/battery-state-card)
* [button-card](https://github.com/custom-cards/button-card)
* [card-mod](https://github.com/thomasloven/lovelace-card-mod)
* [clock-weather-card](https://github.com/pkissling/clock-weather-card)
* [Darkish Theme](https://github.com/78wesley/Home-Assistant-Darkish-Theme)
* [homeassistant_electrolux_status](https://github.com/mauro-midolo/homeassistant_electrolux_status) (Electrolux EOB9S21WX and AEG NSC7P751DS)
* [Lovelace Horizon Card](https://github.com/rejuvenate/lovelace-horizon-card)
* [fold-entity-row](https://github.com/thomasloven/lovelace-fold-entity-row)
* [Home Assistant Swipe Navigation](https://github.com/zanna-37/hass-swipe-navigation)
* [history-explorer-card](https://github.com/SpangleLabs/history-explorer-card)
* [hui-element](https://github.com/thomasloven/lovelace-hui-element)
* [layout-card](https://github.com/thomasloven/lovelace-layout-card)
* [Lovelace Swipe Navigation](https://github.com/maykar/lovelace-swipe-navigation)
* [mini-graph-card](https://github.com/kalkih/mini-graph-card)
* [Mushroom](https://github.com/piitaya/lovelace-mushroom)
* [Mushroom Themes](https://github.com/piitaya/lovelace-mushroom-themes) (not currently used)
* [Paper Buttons Row](https://github.com/jcwillox/lovelace-paper-buttons-row) (not currently used)
* [Plotly Graph Card](https://github.com/dbuezas/lovelace-plotly-graph-card)
* [Reeder Dark Theme](https://github.com/hekm77/reeder_dark_theme)
* [Scheduler Card](https://github.com/nielsfaber/scheduler-card) (not currently used)
* [Shutter Card](https://github.com/Deejayfool/hass-shutter-card)
* [Tabbed Card](https://github.com/kinghat/tabbed-card)
* [Zigbee2mqtt Networkmap Card](https://github.com/azuwis/zigbee2mqtt-networkmap)
## Custom Component Used (not included in HACS)
The following integrations are not part of HACS. It's required to clone the related repository in the folder git_repos.
* [bravia-auth-and-remote](https://github.com/breunigs/bravia-auth-and-remote)
* [FritzBoxShell](https://github.com/xraver/FritzBoxShell)

## Installation
* Clone repository
* Add the following files:
  * credentials/*
  * .google_maps_location_sharing.cookies.EMAIL_gmail_com
  * known_devices.yaml
  * secrets.yaml
* Download HACS
* Clone custom components not included in HACS into git_repos folder
* Start Home Assistant
* Create Users/People
* Configure the following integrations using UI:
  * AVM FRITZ!Box Tools (disabling the network device tracking)
  * Certificate Expiry
  * CO2 Signal
  * DNS IP
  * Electrolux (disabling WiFi sensors)
  * Google Calendar
  * Google Cast
  * HACS
  * Internet Printing Protocol
  * LG webOS Smart TV
  * Mercedes Me
  * MQTT
  * MELCloud (rename climate.zona_giorno_2 to climate.climatizzatore_zona_giorno, climate.zona_notte to climate.climatizzatore_zona_notte, climate.studio_2 to climate.climatizzatore_studio)
  * Notify push html5
  * Netatmo (rename select.casa_ravera_testa to select.netatmo_casa_ravera_testa and assign names to all devices)
  * Openweather Map (Savona + Morgex)
  * Shelly Devices (with the exception of Shelly Bulb) enabling firmware update sensor
  * Sony Bravia
  * SpeedTest
  * Telegram Bot
  * UPNP
  * Version (local)
* Create labels for different devices type (Acqua, BTicino, Elettrodomestici, Energia, Luci, Multimedia, Netatmo, Porte e Finestre, Tapparelle, Temperatura, Shelly, zigbee2mqtt)
* Enable Zigbee2MQTT Network Map under Zigbee2MQTT Bridge and set "Power-on behavior" attribute to all zigbee2mqtt devices to previous
* Restart Home Assistant

## Editor
All files are edited with [Visual Studio Code](https://code.visualstudio.com/).

## Testing
All files are tested using a dedicated [github action](https://github.com/xraver/homeassistant/actions/workflows/ci-validation.yaml).

## To Do List
* Improve notification system to include companion app including (alerts)[https://www.home-assistant.io/integrations/alert/]
* Improve Fritz management interface
* NFC
* Lovelace:
   - Point and click on rooms
   - House plant
* Trenitalia Integration
* [Network components](https://community.home-assistant.io/t/need-help-with-sensor-icon-color-based-on-state/49292)
* Theft Protection
* [Presence Simulator](https://indomus.it/progetti/simulare-automaticamente-la-presenza-in-casa-tramite-la-domotica-home-assistant/)
* Xiaomi Switch + Shelly Plug S
* [Media Source](https://www.home-assistant.io/integrations/media_source) from NAS

## License
[MIT](http://opensource.org/licenses/MIT) © Giorgio Ravera

## Donate
[![BuyMeCoffee][buymecoffee-button]][buymecoffee-url]

---

[check-status-img]: https://github.com/xraver/homeassistant/actions/workflows/ci-validation.yaml/badge.svg
[check-status-url]: https://github.com/xraver/homeassistant/actions/workflows/ci-validation.yaml
[license-img]: https://img.shields.io/github/license/xraver/homeassistant
[license-url]: LICENSE
[releases-img]: https://img.shields.io/github/v/release/xraver/homeassistant
[releases-url]: https://github.com/xraver/homeassistant/releases
[last-commit-img]: https://img.shields.io/github/last-commit/xraver/homeassistant
[last-commit-url]: https://github.com/xraver/homeassistant/commits/master
[buymecoffee-img]: https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg
[buymecoffee-button]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymecoffee-url]: https://www.buymeacoffee.com/raverag
