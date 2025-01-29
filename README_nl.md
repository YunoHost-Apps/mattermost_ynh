<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Mattermost voor Yunohost

[![Integratieniveau](https://apps.yunohost.org/badge/integration/mattermost)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
![Mate van functioneren](https://apps.yunohost.org/badge/state/mattermost)
![Onderhoudsstatus](https://apps.yunohost.org/badge/maintained/mattermost)

[![Mattermost met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Mattermost snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

## Mattermost Team Edition

A free-to-use, open source, self-hosted alternative to proprietary SaaS messaging. Team Edition is your open source “virtual office”, offering all the core productivity benefits of competing SaaS solutions. It deploys as a single Linux binary with PosgreSQL under an MIT license.

## Mattermost Enterprise Edition

To explore the benefits of Mattermost’s enterprise features, you can replace the Mattermost Team Edition binary with a Mattermost Enterprise Edition binary. This version supports upgrading to Mattermost Enterprise Edition E10 or E20.

## YunoHost specific features

This package can install the [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) or the [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

Mattermost Mobile and Desktop Apps are available [here](https://mattermost.com/download/)

### Features

- One-to-one and group messaging, file sharing, and unlimited search history
- Threaded messaging, emoji, and custom emoji
- Tools for custom branding
- Continuous archiving
- Multi-factor authentication
- Highly customizable third-party bots, integrations, and command line tools
- Extensive integration support via webhooks, APIs, drivers, and third-party extensions
- Easily scalable to dozens of users per team
- Runtime profiling data and system monitoring reports


**Geleverde versie:** 10.4.2~ynh1

## Schermafdrukken

![Schermafdrukken van Mattermost](./doc/screenshots/screenshot.png)

## Documentatie en bronnen

- Officiele website van de app: <http://www.mattermost.org/>
- Officiele gebruikersdocumentatie: <https://docs.mattermost.com/guides/messaging.html>
- Officiele beheerdersdocumentatie: <https://docs.mattermost.com/guides/deployment.html>
- Upstream app codedepot: <https://github.com/mattermost/mattermost-server>
- YunoHost-store: <https://apps.yunohost.org/app/mattermost>
- Meld een bug: <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
of
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
