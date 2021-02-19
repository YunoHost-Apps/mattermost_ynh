# Mattermost pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)  
[![Installer Mattermost avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer Mattermost rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, consultez [le guide](https://yunohost.org/#/install) pour apprendre comment l'installer.*

## Vue d'ensemble
Mattermost est un logiciel et un service de messagerie instantanée libre auto-hébergeable. Il est conçu comme un chat interne pour les organisations et les entreprises, et il est présenté comme une alternative à Slack.

**Version incluse :** 5.32.1

## Captures d'écran

![](https://ucarecdn.com/8cd90d9d-8902-4845-a15b-f4664e5fcfb3/-/format/auto/-/quality/lighter/-/max_icc_size/10/-/resize/1288x/)

## Configuration

 * Comment configurer cette application : via le panneau d'administration, un fichier brut en SSH.

## Documentation

 * Documentation officielle : https://docs.mattermost.com/
 * Documentation YunoHost : https://yunohost.org/#/app_mattermost_fr

## Caractéristiques spécifiques YunoHost

Ce paquet peut installer la version [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) ou la version [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

#### Support multi-utilisateur

 * L'authentification LDAP et HTTP est-elle prise en charge ? **Non**
 * L'application peut-elle être utilisée par plusieurs utilisateurs ? **Oui**

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mattermost%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mattermost/)

## Limitations

* L'intégration LDAP n'est pas gérée (see #58)

## Informations additionnelles

Ce paquet peut être installé sur les architectures `ARM`, `ARM64` et `x86-64` (mais uniquement `x86-64` si vous choisissez d'installer la version *Enterprise Edition*).

## Liens

 * Signaler un bug : https://github.com/YunoHost-Apps/mattermost_ynh/issues
 * Site de l'application : http://www.mattermost.org/
 * Dépôt de l'application principale : https://github.com/mattermost/mattermost-server
 * Site web YunoHost : https://yunohost.org/

---

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```
