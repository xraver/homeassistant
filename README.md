# Home Assistant Configuration [![Build Status](https://api.travis-ci.org/xraver/homeassistant.svg?branch=master)](https://travis-ci.org/github/xraver/homeassistant) [![Last Commit](https://img.shields.io/github/last-commit/xraver/homeassistant)](https://github.com/xraver/homeassistant/commits/master) [![License Status](https://img.shields.io/github/license/xraver/homeassistant)](https://github.com/xraver/homeassistant/blob/master/LICENSE)
This repository contains the [Home Assistant](https://www.home-assistant.io/) configuration for my house: Casa Ravera-Testa.

## Running System
Home Assistant is running in a container created from the official [Docker Image](https://hub.docker.com/r/homeassistant/home-assistant).
Docker is running in a Virtual Machine based on [Linux Debian](https://www.debian.org/).
My server is an Intel NUC (NUC5i5RYH) with [XCP-ng Hypervisor](https://xcp-ng.org/).

## Component Used
* Google (Chromecast, Google Home Mini)
* Shelly (Shelly1, Shelly2, Shelly2.5, ShellyEM, Shelly Dimmer)
* Xiaomi (MiJia door & window contact sensor, MiJia temperature & humidity sensor)
* MAX! eQ-3 (Thermostatic valve)
* Sony Android TV (KD-55XF8596)
* Canon Printer (TR8550)
* QNAP NAS (TS-228A)
* ~~Mercedes Me (Mercedes-Benz A200d)~~

## Installation
* Clone repository
* Add the following files:
  * credentials/*
  * .google_maps_location_sharing.cookies.EMAIL_gmail_com
  * known_devices.yaml
  * secrets.yaml
* Start Home Assistant
* Create Users/People
* Configure the following integrations using UI:
  * Certificate Expiry
  * Google Cast
  * HACS
  * Internet Printing Protocol 
  * MQTT
  * Sony Bravia
  * UPNP
* Restart Home Assistant

## Editor
All files are edited with [Visual Studio Code](https://code.visualstudio.com/).

## Testing
All files are tested using the latest stable version of Home Assistant using [Travis](https://travis-ci.com/github/xraver/homeassistant).

## To Do List
* NFC
* Lovelace:
   - Point and click on rooms
   - House lant
   - Mercedes Me
* Trenitalia Integration
* [Network components](https://community.home-assistant.io/t/need-help-with-sensor-icon-color-based-on-state/49292)
* PS4
* Automazion Mode
* Theft Protection
* [Presence Simulator](https://indomus.it/progetti/simulare-automaticamente-la-presenza-in-casa-tramite-la-domotica-home-assistant/)
* Netatmo (thermostatic valve + doorbell)
* ESP8266 (ESP01 + NodeMCU)
* Scene
* Xiaomi Switch + Shelly Plug S

## License
[MIT](http://opensource.org/licenses/MIT) © Giorgio Ravera

## Donate
If you want to offer me a coffee:

[![paypal](https://www.paypalobjects.com/en_US/IT/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=giorgio.ravera%40gmail.com&currency_code=EUR)
