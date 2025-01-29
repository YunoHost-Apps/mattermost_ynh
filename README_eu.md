<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Mattermost YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/mattermost)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/mattermost)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/mattermost)

[![Instalatu Mattermost YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Mattermost YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

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


**Paketatutako bertsioa:** 10.4.2~ynh1

## Pantaila-argazkiak

![Mattermost(r)en pantaila-argazkia](./doc/screenshots/screenshot.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <http://www.mattermost.org/>
- Erabiltzaileen dokumentazio ofiziala: <https://docs.mattermost.com/guides/messaging.html>
- Administratzaileen dokumentazio ofiziala: <https://docs.mattermost.com/guides/deployment.html>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/mattermost/mattermost-server>
- YunoHost Denda: <https://apps.yunohost.org/app/mattermost>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
edo
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
