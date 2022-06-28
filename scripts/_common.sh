#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="postgresql postgresql-contrib pgloader"

#=================================================
# PERSONAL HELPERS
#=================================================

mysql-to-pg() {

	if mysqlshow | grep -q "^| $db_name "; then

		ynh_script_progression --message="Migrating to PostgreSQL database..." --weight=10

		mysql_db_pwd=$(ynh_app_setting_get --app=$app --key=mysqlpwd)

		db_pwd=$(ynh_string_random --length=24)
		ynh_app_setting_set --app=$app --key=db_pwd --value=$db_pwd
		ynh_psql_test_if_first_run
		ynh_psql_setup_db --db_user=$db_user --db_name=$db_name --db_pwd=$db_pwd

		# Migrating from MySQL to PostgreSQL
		pgloader mysql://mattermost:$mysql_db_pwd@localhost:3306/mattermost postgresql://mattermost:$db_pwd@localhost:5432/mattermost
		
		ynh_replace_string --match_string="\(\"DriverName\" *: \).*," --replace_string="\"DriverName\": \"postgres\"", --target_file="$final_path/config/config.json"
		ynh_replace_string --match_string="\(\"DataSource\" *: \).*," --replace_string="\"DataSource\": \"postgres://$db_user:$db_pwd@localhost:5432/$db_name?sslmode=disable&connect_timeout=10\"", --target_file="$final_path/config/config.json"

		# Removinging MySQL database
		ynh_mysql_remove_db --db_user=$db_user --db_name=$db_name

	else
		ynh_print_info --message="No migration needed"
	fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
