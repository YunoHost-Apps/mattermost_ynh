# Mattermost for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)  
[![Install Mattermost with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

## Overview
A Yunohost package for [Mattermost](http://www.mattermost.org/), an open-source, self-hosted alternative to Slack.

## Requirements

Mattermost requires:

* A x86_64 system (check with `uname -m`) (ARM Raspberry Pi won’t work, sorry),
* Yunohost 3.0 or higher (check in Yunohost Admin panel),
* MySQL 5.6 or higher, or MariaDB 10 or higher (check with `mysql --version`).

## Installing

You can either :

* Install by clicking the button above;
* Install from the Yunohost Admin web interface, from the Community Apps list;
* Install from the command-line: `sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh`.

## What works

* Installation on domain root or sub-directory
* Notification emails
* Push notifications (through Mattermost relay server)
* Service control in Yunohost Services panel

## TODO

* ARM compatible package for Raspberry Pi (see #124)
* LDAP integration (only paid Entreprise Edition, see [#58](https://github.com/YunoHost-Apps/mattermost_ynh/issues/58))

## About telemetrics

Mattermost can collect some anonymous telemetrics about your usage of the software. These data are sent to a third-party service named [segment.com](https://segment.com/).
You can find more information about this behavior in the [Mattermost documentation](https://docs.mattermost.com/administration/telemetry.html).

In this Yunohost package telemetrics collection is strictly opt-in, and can be turned on or off before the app is installed.
