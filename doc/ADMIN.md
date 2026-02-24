You can change the installed edition (Team <-> Enterprise) with the command line.

From Enterprise to Team

`sudo yunohost app setting mattermost version --value "Team"`
    
From Team to Enterprise

`sudo yunohost app setting mattermost version --value "Enterprise"`
    
Then upgrade the app (in command line or in the webapp).

The edition should be visible in the Mattermost header. It can also be visible in System Console.

### Mostlymatter

Since 11.2.1~ynh2, you can choose to use the "Mostlymatter" as a mattermost server. Mostlymatter is a fork of the Team Edition that removes the user limits.

You can choose the Mostlymatter edition by changing the version setting:

```
sudo yunohost app setting mattermost version --value Mostlymatter
sudo yunohost app upgrade mattermost
```
