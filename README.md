<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# Mattermost for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![Working status](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)

[![Install Mattermost with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Mattermost quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

## Mattermost Team Edition

A free-to-use, open source, self-hosted alternative to proprietary SaaS messaging. Team Edition is your open source “virtual office”, offering all the core productivity benefits of competing SaaS solutions. It deploys as a single Linux binary with PosgreSQL under an MIT license.

## Mattermost Enterprise Edition

To explore the benefits of Mattermost’s enterprise features, you can replace the Mattermost Team Edition binary with a Mattermost Enterprise Edition binary. This version supports upgrading to Mattermost Enterprise Edition E10 or E20.

## YunoHost specific features

This package can install the [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) or the [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

Mattermost Mobile and Desktop Apps are available [here](https://mattermost.com/download/)

## Features include:

- One-to-one and group messaging, file sharing, and unlimited search history
- Threaded messaging, emoji, and custom emoji
- Tools for custom branding
- Continuous archiving
- Multi-factor authentication
- Highly customizable third-party bots, integrations, and command line tools
- Extensive integration support via webhooks, APIs, drivers, and third-party extensions
- Easily scalable to dozens of users per team
- Runtime profiling data and system monitoring reports


**Shipped version:** 8.1.1~ynh2

## Screenshots

![Screenshot of Mattermost](./doc/screenshots/screenshot.png)

## Documentation and resources

* Official app website: <http://www.mattermost.org/>
* Official user documentation: <https://docs.mattermost.com/guides/messaging.html>
* Official admin documentation: <https://docs.mattermost.com/guides/deployment.html>
* Upstream app code repository: <https://github.com/mattermost/mattermost-server>
* YunoHost documentation for this app: <https://yunohost.org/app_mattermost>
* Report a bug: <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
or
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
