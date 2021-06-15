# Mattermost pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)  
[![Installer Mattermost avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Mattermost rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Plateforme de collaboration open source conçue pour les développeurs

**Version incluse :** 5.35.3~ynh1



## Captures d'écran

![](./doc/screenshots/screenshot.png)

## Avertissements / informations importantes

## Configuration

 * Comment configurer cette application : via le panneau d'administration, un fichier brut en SSH.

## Caractéristiques spécifiques YunoHost

Ce paquet peut installer la version [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) ou la version [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

## Limitations

* L'intégration LDAP n'est pas gérée (see #58)

## Informations additionnelles

Ce paquet peut être installé sur les architectures `ARM`, `ARM64` et `x86-64` (mais uniquement `x86-64` si vous choisissez d'installer la version *Enterprise Edition*).

## Documentations et ressources

* Site officiel de l'app : http://www.mattermost.org/
* Documentation officielle utilisateur : https://yunohost.org/en/app_mattermost
* Documentation officielle de l'admin : https://docs.mattermost.com/
* Dépôt de code officiel de l'app : https://github.com/mattermost/mattermost-server
* Documentation YunoHost pour cette app : https://yunohost.org/app_mattermost
* Signaler un bug : https://github.com/YunoHost-Apps/mattermost_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps