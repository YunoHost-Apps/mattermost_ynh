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

	  ynh_script_progression --message="Creating a PostgreSQL database..." --weight=10

	  mysql_db_pwd=$(ynh_app_setting_get --app=$app --key=mysqlpwd)

	  db_pwd=$(ynh_string_random --length=24)
	  ynh_app_setting_set --app=$app --key=db_pwd --value=$db_pwd
	  ynh_psql_test_if_first_run
	  ynh_psql_setup_db --db_user=$db_user --db_name=$db_name --db_pwd=$db_pwd

	  tmpdir="$(mktemp -d)"
	  ynh_add_config --template="../conf/mysql-to-pg.conf" --destination="$tmpdir/mysql-to-pg.conf"
	  # Migrating from MySQL to PostgreSQL
	  pgloader $tmpdir/mysql-to-pg.conf

	  # Removinging MySQL database
	  ynh_mysql_remove_db --db_user=$db_user --db_name=$db_name
	  ynh_secure_remove --file="$tmpdir"

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
