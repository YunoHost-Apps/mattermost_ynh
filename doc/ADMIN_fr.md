Vous pouvez changer l'édition installée (Team <-> Enterprise) en ligne de commande.

Depuis Enterprise vers Team

`sudo yunohost app setting mattermost version --value "Team"`
    
Depuis Team vers Enterprise

`sudo yunohost app setting mattermost version --value "Enterprise"`

Puis mettez à jour l'application (en ligne de commande ou dans l'admin web).

L'édition devrait être visible dans l'en-tête de Mattermost. C'est également visible dans la Console Système.

### Mostlymatter

Depuis la version 11.2.1~ynh2, vous pouvez choisir d'utiliser « Mostlymatter » comme serveur Mattermost. Mostlymatter est un fork de l'édition Team qui supprime les limites d'utilisateurs.

Vous pouvez choisir l'édition Mostlymatter en modifiant le paramètre de version :

```
sudo yunohost app setting mattermost version --value Mostlymatter
sudo yunohost app upgrade mattermost
```
