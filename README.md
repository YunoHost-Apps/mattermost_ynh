## Description

A Yunohost package for [Mattermost](http://www.mattermost.org/), an open-source, self-hosted alternative to Slack.

## Requirements

Mattermost requires:

* A x86_64 system (check with `uname -m`),
* MySQL 5.6 or higher (check with `mysql --version`).

## Installation

You can either :

* Install from the Admin web interface, by providing this URL: `https://github.com/kemenaran/yunohost-mattermost`
* Install from the command-line: `yunohost app install https://github.com/kemenaran/yunohost-mattermost`

## What works

* Installation on domain's root
* Notification emails

## TODO

* Allow installation in sub-directory (only root-domains work for now)
* LDAP integration
