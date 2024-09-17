#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# We want Mattermost emails to be sent from the main domain
# (the one for which the emails headers are properly configured),
# and not the subdomain or secondary domain used for Mattermost.
main_domain=$(cat /etc/yunohost/current_host)

#=================================================
# PERSONAL HELPERS
#=================================================

mariadb-to-pg() {

        ynh_print_info --message="Migrating to PostgreSQL database..."

        # Retrieve MySQL user and password
        mysqlpwd=$(ynh_app_setting_get --app=$app --key=mysqlpwd)

        mysql_db_user="$db_user"
        if ynh_mysql_connect_as --user="mmuser" --password="$mysqlpwd" 2> /dev/null <<< ";"; then
            # On old instances db_user is `mmuser`
            mysql_db_user="mmuser"
        fi

        # The PostgreSQL database has already been created by Yunohost before running the script.
        # Configure the new database and run Mattermost in order to create tables.
        ynh_write_var_in_file --file="$install_dir/config/config.json" --key="DriverName" --value="postgres" --after="SqlSettings"
        ynh_write_var_in_file --file="$install_dir/config/config.json" --key="DataSource" --value="postgres://$db_user:$db_pwd@localhost:5432/$db_name?sslmode=disable&connect_timeout=10" --after="SqlSettings"
        cat "$install_dir/config/config.json"
        pushd $install_dir
        ynh_systemd_action --service_name="$app" --action="stop"
        set +e
        sudo -u $app timeout --preserve-status 300 "./bin/mattermost"
        if [ "$?" != "0" ] && [ "$?" != "143" ] ; then
            ynh_die --message="Failed to run Mattermost to create PostgreSQL database tables" --ret_code=1
        fi
        set -e
        popd

        # Some fixes to let the MariaDB -> PostgreSQL conversion working
        ynh_psql_execute_as_root --sql='DROP INDEX public.idx_fileinfo_content_txt;' --database=$db_name
        ynh_psql_execute_as_root --sql='DROP INDEX public.idx_posts_message_txt;' --database=$db_name
        ynh_mysql_execute_as_root --sql="ALTER TABLE mattermost.Users DROP COLUMN IF EXISTS acceptedtermsofserviceid;" --database=$db_name
        ynh_mysql_execute_as_root --sql="ALTER TABLE mattermost.SharedChannelRemotes DROP COLUMN IF EXISTS description;" --database=$db_name
        ynh_mysql_execute_as_root --sql="ALTER TABLE mattermost.SharedChannelRemotes DROP COLUMN IF EXISTS nextsyncat;" --database=$db_name
        
        # Focalboard is broken in Mattermost 7.3.0
        if ynh_compare_current_package_version --comparison eq --version 7.3.0~ynh1
        then
            remove_focalboard_if_7_3_0="EXCLUDING TABLE NAMES MATCHING ~/^focalboard_/"
        else
            remove_focalboard_if_7_3_0=""
        fi

        # Use pgloader to migrate database content from MariaDB to PostgreSQL
        tmpdir="$(mktemp -d)"

        cat <<EOT > $tmpdir/commands.load
LOAD DATABASE
     FROM mysql://$mysql_db_user:$mysqlpwd@127.0.0.1:3306/$db_name
     INTO postgresql://$db_user:$db_pwd@127.0.0.1:5432/$db_name

WITH include no drop, truncate, create no tables,
     create no indexes, preserve index names, no foreign keys,
     data only, workers = 16, concurrency = 1, prefetch rows = 10000

SET MySQL PARAMETERS
net_read_timeout = '90',
net_write_timeout = '180'

$remove_focalboard_if_7_3_0

ALTER SCHEMA '$db_name' RENAME TO 'public'

;
EOT
        pgloader $tmpdir/commands.load

        # Rebuild INDEX
        ynh_psql_execute_as_root --sql='CREATE INDEX idx_fileinfo_content_txt ON public.fileinfo USING gin (to_tsvector('\''english'\''::regconfig, content))' --database=$db_name
        ynh_psql_execute_as_root --sql='CREATE INDEX idx_posts_message_txt ON public.posts USING gin (to_tsvector('\''english'\''::regconfig, (message)::text));' --database=$db_name

        if ynh_compare_current_package_version --comparison eq --version 7.3.0~ynh1
        then
            # There is a problem with version 7.3.0 and the database migration.
            # More information here: https://forum.mattermost.com/t/migrating-from-mariadb-to-postgresql-db/14194/6
            ynh_psql_execute_as_root --sql="DELETE FROM db_migrations WHERE version=92;" --database=$db_name
        fi

        # Remove the MariaDB database
        ynh_mysql_drop_db $db_name
}
