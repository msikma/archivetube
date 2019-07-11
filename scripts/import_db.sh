#!/usr/bin/env bash

dbname="archivetube"
echo 'This will delete the `'$dbname'` database and reinitialize it.'
read -p 'Are you sure? ' -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo 'Canceled.'
  exit
fi

# Check if the migrations file exists.
script_dir=$(dirname "$(realpath $0)")
migration=$script_dir"/../migrations/initial.sql"
if [ ! -f $migration ]; then
  echo 'Could not find `<repo root>/migrations/initial.sql`.'
  echo 'Canceled.'
  exit
fi

# Drop and remake the database.
mysql -uroot -proot --execute="drop database if exists $dbname; create database $dbname character set utf8mb4 collate utf8mb4_unicode_ci;"

# Import the schema.
mysql -uroot -proot --database="$dbname" < $migration

# List tables just to confirm everything worked.
echo 'Done. Listing tables:'
mysql -uroot -proot --execute="use $dbname; show tables;"

exit
