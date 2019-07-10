#!/usr/bin/env bash

dbname="archivetube"
echo 'This will overwrite the migrations/initial.sql file.'
read -p 'Are you sure? ' -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo 'Canceled.'
  exit
fi

script_dir=$(dirname "$(realpath $0)")
migration=$script_dir"/../migrations/initial.sql"

# Dump database to the migration file.
mysqldump -uroot -proot archivetube > $migration

# List tables just to confirm everything worked.
echo 'Done. Listing tables:'
mysql -uroot -proot --execute="use $dbname; show tables;"

exit
