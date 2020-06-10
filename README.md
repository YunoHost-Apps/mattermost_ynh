# Mattermost for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)   
[![Install Mattermost with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mattermost)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install Mattermost quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview

Mattermost is a decentralized team communication software. For Slack enthusiasts, importing your data is possible, allowing a smooth transition to this free tool.

**Shipped version:** 5.23.1

## Screenshots

![](https://user-images.githubusercontent.com/13119842/56807911-1bf66f00-67fe-11e9-9b7b-96ce9ceab645.png)

## Demo

* [Official demo](https://mattermost.com/demo/)

## Configuration

How to configure this app: by an admin panel, a plain file with SSH, or any other way.

## Documentation

 * Official documentation: https://docs.mattermost.com/
 * YunoHost documentation: https://yunohost.org/#/app_mattermost

## YunoHost specific features

## About telemetrics

Mattermost can collect some anonymous telemetrics about your usage of the software. These data are sent to a third-party service named [segment.com](https://segment.com/).
You can find more information about this behavior in the [Mattermost documentation](https://docs.mattermost.com/administration/telemetry.html).

In this Yunohost package telemetrics collection is strictly opt-in, and can be turned on or off before the app is installed.

#### Multi-users support

* Are LDAP and HTTP auth supported? **No**
* Can the app be used by multiple users? **Yes**

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mattermost/)
* Buster x86-64 - [![](https://ci-buster.nohost.me/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-buster.nohost.me/ci/apps/mattermost/)

## Limitations

* A x86_64 system (check with `uname -m`) (ARM Raspberry Pi won’t work, sorry),

## Additional information

* Other information you would add about this application

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mattermost_ynh/issues
 * App website: https://mattermost.com/
 * Upstream app repository: https://github.com/mattermost/mattermost-server
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
or
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```
