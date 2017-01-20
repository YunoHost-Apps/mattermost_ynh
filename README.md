## Description

A Yunohost package for [Mattermost](http://www.mattermost.org/), an open-source, self-hosted alternative to Slack.

## Requirements

Mattermost requires:

* A x86_64 system (check with `uname -m`),
* MySQL 5.6 or higher, or MariaDB 10 or higher (check with `mysql --version`).

## Installing

You can either :

* Install from the Yunohost Admin web interface, by providing this URL: `https://github.com/kemenaran/mattermost_ynh`
* Install from the command-line: `yunohost app install https://github.com/kemenaran/mattermost_ynh`

## Upgrading

Mattermost upgrades tend to work only from one minor version to the other (3.0 to 3.1, 3.1 to 3.2, etc).

**Important**: to upgrade from Mattermost 2.2, you will need an extra manual step.
Run the upgrade from Yunohost, then follow [this guide](https://docs.mattermost.com/administration/upgrade.html).

## What works

* Installation on domain's root
* Notification emails

## TODO

* Allow installation in sub-directory (only root-domains work for now)
* LDAP integration
