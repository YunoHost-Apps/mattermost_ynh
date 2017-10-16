## Description

A Yunohost package for [Mattermost](http://www.mattermost.org/), an open-source, self-hosted alternative to Slack.

## Build status

See https://ci-apps.yunohost.org/jenkins/job/mattermost%20(Community)/ for checking current build status.

## Requirements

Mattermost requires:

* A x86_64 system (check with `uname -m`),
* Yunohost 2.7 or higher (check in Yunohost Admin panel),
* MySQL 5.6 or higher, or MariaDB 10 or higher (check with `mysql --version`).

## Installing

You can either :

* Install from the Yunohost Admin web interface, by providing this URL: `https://github.com/YunoHost-Apps/mattermost_ynh`
* Install from the command-line: `sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh`

## Upgrading

Mattermost upgrades tend to work only from one minor version to the other (3.0 to 3.1, 3.1 to 3.2, etc).

**Important**: to upgrade from Mattermost 2.2, you will need an extra manual step.
Run the upgrade from Yunohost, then follow [this guide](https://docs.mattermost.com/administration/upgrade.html).

## What works

* Installation on domain's root
* Notification emails
* Push notifications
* Service control in Yunohost Services panel

## TODO

* Allow installation in sub-directory (only root-domains for now, see [#8](https://github.com/YunoHost-Apps/mattermost_ynh/issues/8))
* LDAP integration (only paid Entreprise Edition, see [#58](https://github.com/YunoHost-Apps/mattermost_ynh/issues/58))

## About telemetrics
Mattermost is used to send some telemetrics about your usage of it.
But this data doesn't send to mattermost, but to a third party site named [segment.com](https://segment.com/).
You can find more information about his behavior on the [mattermost documentation](https://docs.mattermost.com/administration/telemetry.html).

This behavior can be turn on or off when you install this app.
