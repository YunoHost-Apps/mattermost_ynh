<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Mattermost untuk YunoHost

[![Tingkat integrasi](https://apps.yunohost.org/badge/integration/mattermost)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
![Status kerja](https://apps.yunohost.org/badge/state/mattermost)
![Status pemeliharaan](https://apps.yunohost.org/badge/maintained/mattermost)

[![Pasang Mattermost dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Mattermost secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

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


**Versi terkirim:** 10.4.2~ynh1

## Tangkapan Layar

![Tangkapan Layar pada Mattermost](./doc/screenshots/screenshot.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <http://www.mattermost.org/>
- Dokumentasi pengguna resmi: <https://docs.mattermost.com/guides/messaging.html>
- Dokumentasi admin resmi: <https://docs.mattermost.com/guides/deployment.html>
- Depot kode aplikasi hulu: <https://github.com/mattermost/mattermost-server>
- Gudang YunoHost: <https://apps.yunohost.org/app/mattermost>
- Laporkan bug: <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
atau
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
