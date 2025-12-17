You can change the installed edition (Team <-> Enterprise) with the command line.

From Enterprise to Team

`sudo yunohost app setting mattermost version --value "Team"`
    
From Team to Enterprise

`sudo yunohost app setting mattermost version --value "Enterprise"`
    
Then upgrade the app (in command line or in the webapp).

The edition should be visible in the Mattermost header. It can also be visible in System Console.
