## Configuration

* How to configure this app: From an admin panel, a plain file with SSH.
* How to change from edition version to another (Team<->Enterprise) : Modify the `settings.yml` in the apps directory `/etc/yunohost/apps/mattermost_instance/settings.yml` and replace the version to wich you whant : Team or Enterprise. Update your apps and verify the *About* on your mattermost

## YunoHost specific features

This package can install the [*Entreprise Edition*](https://docs.mattermost.com/overview/product.html#mattermost-enterprise-edition) or the [*Team Edition*](https://docs.mattermost.com/overview/product.html#mattermost-team-edition).

Mattermost Mobile and Desktop Apps are available [here](https://mattermost.com/download/)

## Limitations

* LDAP integration is not supported (see [#58](https://github.com/YunoHost-Apps/mattermost_ynh/issues/58))

## Additional information

* This package can by installed on `ARM`, `ARM64` and `x86-64` architecture (only `x86-64` and `ARM64` if you choose to install the *Entreprise Edition*).
