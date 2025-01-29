<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# Mattermost para Yunohost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/mattermost)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
![Estado funcional](https://apps.yunohost.org/badge/state/mattermost)
![Estado En Mantención](https://apps.yunohost.org/badge/maintained/mattermost)

[![Instalar Mattermost con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarMattermost rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

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


**Versión actual:** 10.4.2~ynh1

## Capturas

![Captura de Mattermost](./doc/screenshots/screenshot.png)

## Documentaciones y recursos

- Sitio web oficial: <http://www.mattermost.org/>
- Documentación usuario oficial: <https://docs.mattermost.com/guides/messaging.html>
- Documentación administrador oficial: <https://docs.mattermost.com/guides/deployment.html>
- Repositorio del código fuente oficial de la aplicación : <https://github.com/mattermost/mattermost-server>
- Catálogo YunoHost: <https://apps.yunohost.org/app/mattermost>
- Reportar un error: <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [rama `testing`](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
o
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
