#!/bin/bash

# configure vars
DB_USER="__DB_USER__"
DB_NAME="__DB_NAME__"
DB_PASS="__DB_PWD__"
DB_HOST="localhost"
RETENTION="__RETENTION__" #number of days to *keep*; 93 ~ 3 months
DATA_DIR="__DATA_DIR__"

# calculate epoch in milisec
delete_before=$(date  --date="$RETENTION day ago"  "+%s%3N")
echo $(date  --date="$RETENTION day ago")
export PGPASSWORD=$DB_PASS

# get list of files to be removed
psql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" --disable-column-names -e "SELECT Path FROM FileInfo WHERE CreateAt < $delete_before;" > /tmp/mattermost-paths.list
psql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" --disable-column-names -e "SELECT ThumbnailPath FROM FileInfo WHERE CreateAt < $delete_before;" >> /tmp/mattermost-paths.list
psql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" --disable-column-names -e "SELECT PreviewPath FROM FileInfo WHERE CreateAt < $delete_before;" >> /tmp/mattermost-paths.list

# get list of posts to be removed
psql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT * FROM Posts WHERE CreateAt < $delete_before;" 

# cleanup db 
psql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "DELETE FROM Posts WHERE CreateAt < $delete_before;"
psql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "DELETE FROM FileInfo WHERE CreateAt < $delete_before;"

# delete files
while read -r fp; do
        if [ -n "$fp" ]; then
                echo "$DATA_DIR""$fp"
                #shred -u "$DATA_DIR""$fp"
		mv "$DATA_DIR""$fp" /tmp/backup_mattermost/
        fi
done < /tmp/mattermost-paths.list

#TODO: delete empty folders

#cleanup after yourself
rm /tmp/mattermost-paths.list
exit 0
