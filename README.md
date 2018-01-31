## Description

A Yunohost package for [Mattermost](http://www.mattermost.org/), an open-source, self-hosted alternative to Slack.

[![Yunohost Build status](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost)

## Requirements

Mattermost requires:

* A x86_64 system (check with `uname -m`),
* Yunohost 2.7 or higher (check in Yunohost Admin panel),
* MySQL 5.6 or higher, or MariaDB 10 or higher (check with `mysql --version`).

## Installing

[![Install Mattermost with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mattermost)

You can either :

* Install by clicking the button above;
* Install from the Yunohost Admin web interface, from the Community Apps list;
* Install from the command-line: `sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh`.

## What works

* Installation on domain's root
* Notification emails
* Push notifications
* Service control in Yunohost Services panel

## TODO

* Allow installation in sub-directory (only root-domains for now, see [#8](https://github.com/YunoHost-Apps/mattermost_ynh/issues/8))
* LDAP integration (only paid Entreprise Edition, see [#58](https://github.com/YunoHost-Apps/mattermost_ynh/issues/58))

## About telemetrics

Mattermost can collect some anonymous telemetrics about your usage of the software. These data are sent to a third-party service named [segment.com](https://segment.com/).
You can find more information about this behavior in the [Mattermost documentation](https://docs.mattermost.com/administration/telemetry.html).

In this Yunohost package telemetrics collection is strictly opt-in, and can be turned on or off before the app is installed.
