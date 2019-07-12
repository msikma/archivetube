#!/usr/bin/env bash

dbname="archivetube"
echo 'This will overwrite the scripts/test_rows.sql file.'
read -p 'Are you sure? ' -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo 'Canceled.'
  exit
fi

script_dir=$(dirname "$(realpath $0)")
test_rows=$script_dir"/test_rows.sql"

# Dump database to the test_rows file.
mysqldump -uroot -proot --no-create-db --no-create-info --skip-triggers archivetube > $test_rows

echo 'Done.'
exit
