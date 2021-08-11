# Home Assistant Configuration
[![Build Status][build-status-img]][build-status-url]
[![Last Commit][last-commit-img]][last-commit-url]
[![License Status][license-img]][license-url]
[![BuyMeCoffee][buymecoffee-img]][buymecoffee-url]

This repository contains the [Home Assistant](https://www.home-assistant.io/) configuration for my house: Casa Ravera-Testa.

## Running System
Home Assistant is running in a container created from the official [Docker Image](https://hub.docker.com/r/homeassistant/home-assistant).
Docker is running in a Virtual Machine based on [Linux Debian](https://www.debian.org/).
My server is an Intel NUC (NUC5i5RYH) with [XCP-ng Hypervisor](https://xcp-ng.org/).

## Component Used
* Google (Chromecast, Google Home Mini)
* Shelly (Shelly1, Shelly2, Shelly2.5, ShellyEM, Shelly Dimmer)
* Xiaomi (MiJia door & window contact sensor, MiJia temperature & humidity sensor)
* Netatmo Thermostatic valves
* Sony Android TV (KD-55XF8596)
* Canon Printer (TR8550)
* QNAP NAS (TS-228A)
* Mercedes Me (Mercedes-Benz A200d)
* HomeKit
* LG WebOS TV (LG 28TL510S-PZ)

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
  * Google Calendar
  * Google Cast
  * HACS
  * Internet Printing Protocol
  * Mercedes Me
  * MQTT
  * Shelly Devices (with the exception of Shelly Bulb)
  * Sony Bravia
  * SpeedTest
  * UPNP
* Restart Home Assistant

## Editor
All files are edited with [Visual Studio Code](https://code.visualstudio.com/).

## Testing
All files are tested using the latest stable version of Home Assistant using [Travis](https://travis-ci.com/github/xraver/homeassistant).

## To Do List
* Script review ([Native types support for templates](https://www.home-assistant.io/blog/2020/10/28/release-117/#native-types-support-for-templates-beta) after release 117)
* NFC
* Lovelace:
   - Point and click on rooms
   - House plant
* Trenitalia Integration
* [Network components](https://community.home-assistant.io/t/need-help-with-sensor-icon-color-based-on-state/49292)
* PS4
* Theft Protection
* [Presence Simulator](https://indomus.it/progetti/simulare-automaticamente-la-presenza-in-casa-tramite-la-domotica-home-assistant/)
* ESP8266 (ESP01 + NodeMCU)
* Scene
* Xiaomi Switch + Shelly Plug S
* [Media Source](https://www.home-assistant.io/integrations/media_source) from NAS

## License
[MIT](http://opensource.org/licenses/MIT) © Giorgio Ravera

## Donate
[![BuyMeCoffee][buymecoffee-button]][buymecoffee-url]

---

[build-status-img]: https://api.travis-ci.org/xraver/homeassistant.svg?branch=master
[build-status-url]: https://travis-ci.org/github/xraver/homeassistant
[license-img]: https://img.shields.io/github/license/xraver/homeassistant
[license-url]: LICENSE
[releases-img]: https://img.shields.io/github/v/release/xraver/homeassistant
[releases-url]: https://github.com/xraver/homeassistant/releases
[last-commit-img]: https://img.shields.io/github/last-commit/xraver/homeassistant
[last-commit-url]: https://github.com/xraver/homeassistant/commits/master
[buymecoffee-img]: https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg
[buymecoffee-button]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymecoffee-url]: https://www.buymeacoffee.com/raverag
