# Mattermost for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)  
[![Install Mattermost with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install REPLACEBYYOURAPP quickly and simply on a YunoHost server.  
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
A Yunohost package for [Mattermost](http://www.mattermost.org/), an open-source, self-hosted alternative to Slack.

**Shipped version:** 5.30.1

## Screenshots

![](Link to a screenshot of this app.)

## Demo

* [Official demo](Link to a demo site for this app.)

## Configuration

How to configure this app: From an admin panel, a plain file with SSH, or any other way.

## Documentation

 * Official documentation: Link to the official documentation of this app
 * YunoHost documentation: If specific documentation is needed, feel free to contribute.

## YunoHost specific features

#### Multi-user support

 * Are LDAP and HTTP auth supported?
 * Can the app be used by multiple users?

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mattermost/)

## Limitations

* Any known limitations.

## Additional information

* Other info you would like to add about this app.

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mattermost_ynh/issues
 * App website: http://www.mattermost.org/
 * Upstream app repository: Link to the official repository of the upstream app.
 * YunoHost website: https://yunohost.org/

---

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
or
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```
