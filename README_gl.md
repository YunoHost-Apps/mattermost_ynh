<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Mattermost para YunoHost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/mattermost)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
![Estado de funcionamento](https://apps.yunohost.org/badge/state/mattermost)
![Estado de mantemento](https://apps.yunohost.org/badge/maintained/mattermost)

[![Instalar Mattermost con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Mattermost de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

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


**Versión proporcionada:** 10.4.2~ynh1

## Capturas de pantalla

![Captura de pantalla de Mattermost](./doc/screenshots/screenshot.png)

## Documentación e recursos

- Web oficial da app: <http://www.mattermost.org/>
- Documentación oficial para usuarias: <https://docs.mattermost.com/guides/messaging.html>
- Documentación oficial para admin: <https://docs.mattermost.com/guides/deployment.html>
- Repositorio de orixe do código: <https://github.com/mattermost/mattermost-server>
- Tenda YunoHost: <https://apps.yunohost.org/app/mattermost>
- Informar dun problema: <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
