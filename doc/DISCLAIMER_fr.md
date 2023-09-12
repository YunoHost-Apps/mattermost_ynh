## Configuration

* Comment configurer cette application : via le panneau d'administration, un fichier brut en SSH.
* Comment changer d'une version à une autre (Team<->Enterprise) : Modifiez le `settings.yml` dans le répertoire de l'application `/etc/yunohost/apps/mattermost_instance/settings.yml` et remplacez la version avec celle que vous voulez : Team ou Enterprise. Mettez à jour votre application et vérifiez dans le *À Propos* sur la console système de votre application.

## Caractéristiques spécifiques YunoHost

Ce paquet peut installer la version [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) ou la version [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

## Limitations

* L'intégration LDAP n'est pas gérée (see [#58](https://github.com/YunoHost-Apps/mattermost_ynh/issues/58))

## Informations additionnelles

Ce paquet peut être installé sur les architectures `ARM`, `ARM64` et `x86-64` (mais uniquement `x86-64` et `ARM64` si vous choisissez d'installer la version *Enterprise Edition*).
