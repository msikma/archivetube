#!/usr/bin/env bash

dbname="archivetube"
echo 'This will add testing rows to the `'$dbname'` database.'
read -p 'Are you sure? ' -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo 'Canceled.'
  exit
fi

# Check if the test_rows file exists.
script_dir=$(dirname "$(realpath $0)")
test_rows=$script_dir"/test_rows.sql"
if [ ! -f $test_rows ]; then
  echo 'Could not find `<repo root>/dev/test_rows.sql`.'
  echo 'Canceled.'
  exit
fi

# Import the rows.
mysql -uroot -proot --database="$dbname" < $test_rows

# List rows for confirmation.
echo 'Done. Listing rows:'
mysql -uroot -proot --execute="
  SELECT SUM(TABLE_ROWS)
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'archivetube';
  "

exit
