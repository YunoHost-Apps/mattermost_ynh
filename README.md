# Mattermost for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)  
[![Install Mattermost with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Mattermost quickly and simply on a YunoHost server.  
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
Mattermost is a self-hosted, open source instant messaging and service software. It's designed as an internal chat for organizations and businesses, and it's touted as an alternative to Slack.

**Shipped version:** <span class="version">5.34.2</span>

## Screenshots

![](https://ucarecdn.com/8cd90d9d-8902-4845-a15b-f4664e5fcfb3/-/format/auto/-/quality/lighter/-/max_icc_size/10/-/resize/1288x/)

## Configuration

* How to configure this app: From an admin panel, a plain file with SSH.

## Documentation

 * Official documentation: https://docs.mattermost.com/
 * YunoHost documentation: https://yunohost.org/en/app_mattermost

## YunoHost specific features

This package can install the [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) or the [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

Mattermost Mobile and Desktop Apps are available [here](https://mattermost.com/download/)

#### Multi-user support

 * Are LDAP and HTTP auth supported? **No**
 * Can the app be used by multiple users? **Yes**

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mattermost.svg)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mattermost.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mattermost/)

## Limitations

* LDAP integration is not supported (see #58)

## Additional information

* This package can by installed on `ARM`, `ARM64` and `x86-64` architecture (only `x86-64` if you choose to install the *Entreprise Edition*).

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mattermost_ynh/issues
 * App website: http://www.mattermost.org/
 * Upstream app repository: https://github.com/mattermost/mattermost-server
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
