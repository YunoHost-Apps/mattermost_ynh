<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Mattermost pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/mattermost)](https://ci-apps.yunohost.org/ci/apps/mattermost/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/mattermost)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/mattermost)

[![Installer Mattermost avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mattermost)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Mattermost rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

## Mattermost Team Edition

Une alternative gratuite, open source et auto-hébergée à la messagerie SaaS propriétaire. Team Edition est votre « bureau virtuel » open source, offrant tous les principaux avantages de productivité des solutions SaaS concurrentes.

## Mattermost Entreprise Edition

Pour explorer les avantages des fonctionnalités d'entreprise de Mattermost, vous pouvez remplacer le binaire Mattermost Team Edition par un binaire Mattermost Enterprise Edition. Cette version prend en charge la mise à niveau vers Mattermost Enterprise Edition E10 ou E20. 

## Caractéristiques spécifiques YunoHost

Ce paquet peut installer la version [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) ou la version [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).


### Les fonctionnalités

- Messagerie individuelle et de groupe, partage de fichiers et historique de recherche illimité
- Messagerie, emoji et emoji personnalisés
- Outils pour une image de marque personnalisée
- Archivage continu
- Authentification multi-facteurs
- Bots tiers hautement personnalisables, intégrations et outils de ligne de commande
- Prise en charge étendue de l'intégration via des webhooks, des API, des pilotes et des extensions tierces
- Facilement évolutif à des dizaines d'utilisateurs par équipe
- Données de profilage d'exécution et rapports de surveillance du système


**Version incluse :** 10.4.2~ynh1

## Captures d’écran

![Capture d’écran de Mattermost](./doc/screenshots/screenshot.png)

## Documentations et ressources

- Site officiel de l’app : <http://www.mattermost.org/>
- Documentation officielle utilisateur : <https://docs.mattermost.com/guides/messaging.html>
- Documentation officielle de l’admin : <https://docs.mattermost.com/guides/deployment.html>
- Dépôt de code officiel de l’app : <https://github.com/mattermost/mattermost-server>
- YunoHost Store : <https://apps.yunohost.org/app/mattermost>
- Signaler un bug : <https://github.com/YunoHost-Apps/mattermost_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mattermost -u https://github.com/YunoHost-Apps/mattermost_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
