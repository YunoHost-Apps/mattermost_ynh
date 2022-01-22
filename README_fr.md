# Mattermost pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/mattermost.svg)](https://dash.yunohost.org/appci/app/mattermost) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mattermost.maintain.svg)  
[![Installer Mattermost avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Mattermost rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

## Mattermost Team Edition
Une alternative gratuite, open source et auto-hébergée à la messagerie SaaS propriétaire. Team Edition est votre « bureau virtuel » open source, offrant tous les principaux avantages de productivité des solutions SaaS concurrentes.

## Mattermost Entreprise Edition
Pour explorer les avantages des fonctionnalités d'entreprise de Mattermost, vous pouvez remplacer le binaire Mattermost Team Edition par un binaire Mattermost Enterprise Edition. Cette version prend en charge la mise à niveau vers Mattermost Enterprise Edition E10 ou E20. 

## Les fonctionnalités incluent:

- Messagerie individuelle et de groupe, partage de fichiers et historique de recherche illimité
- Applications natives pour iOS, Android, Windows, Mac, Linux
- Messagerie, emoji et emoji personnalisés
- Outils pour une image de marque personnalisée
- Archivage continu
- Authentification multi-facteurs
- Bots tiers hautement personnalisables, intégrations et outils de ligne de commande
- Prise en charge étendue de l'intégration via des webhooks, des API, des pilotes et des extensions tierces
- Facilement évolutif à des dizaines d'utilisateurs par équipe
- Données de profilage d'exécution et rapports de surveillance du système
- Nouvelles fonctionnalités et améliorations publiées régulièrement
- Plusieurs langues dont l'anglais américain, l'anglais australien, le bulgare, le chinois (simplifié et traditionnel), le néerlandais, le français, l'allemand, le hongrois, l'italien, le japonais, le coréen, le polonais, le portugais brésilien, le roumain, le russe, le turc, l'espagnol, le suédois et l'ukrainien 


**Version incluse :** 6.3.1~ynh1



## Captures d'écran

![](./doc/screenshots/screenshot.png)

## Avertissements / informations importantes

## Configuration

* Comment configurer cette application : via le panneau d'administration, un fichier brut en SSH.
* Comment changer d'une version à une autre (Team<->Enterprise) : Modifiez le `settings.yml` dans le répertoire de l'application `/etc/yunohost/apps/mattermost_instance/settings.yml` et remplacez la version avec celle que vous voulez : Team ou Enterprise. Mettez à jour votre application et vérifiez dans le *À Propos* sur la console système de votre application.

## Caractéristiques spécifiques YunoHost

Ce paquet peut installer la version [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) ou la version [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

## Limitations

* L'intégration LDAP n'est pas gérée (see #58)

## Informations additionnelles

Ce paquet peut être installé sur les architectures `ARM`, `ARM64` et `x86-64` (mais uniquement `x86-64` si vous choisissez d'installer la version *Enterprise Edition*).

## Documentations et ressources

* Site officiel de l'app : http://www.mattermost.org/
* Documentation officielle utilisateur : https://docs.mattermost.com/guides/messaging.html
* Documentation officielle de l'admin : https://docs.mattermost.com/guides/deployment.html
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