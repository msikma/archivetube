## ArchiveTube

**Note: still heavily under construction and not production ready.**

This app is a Youtube clone designed to use the [Internet Archive](https://archive.org/) as storage backend. It's set up as a [Next.js](https://zeit.co/guides/deploying-nextjs-with-now/) Node project with MySQL for database storage.

### Development

The two prerequisites for this project are **[`now`](https://zeit.co/download)** and **MySQL (or MariaDB)**.

The quickest way to install both is via **[Yarn](https://yarnpkg.com/)** and your system's package manager (using **[Brew](https://brew.sh/)** on OSX as example):

```sh
yarn global add now
brew install mariadb
```

After installing the database and creating a user, you'll need to create a database:

```sql
create database `archivetube` character set utf8mb4 collate utf8mb4_unicode_ci;
```

Followed by running the migrations:

```shell
TODO
```

To connect the app to your database, you'll need to make a `.env` file in the root directory containing the following values (with your own username and password):

```
MYSQL_HOST=localhost
MYSQL_USER=mysqluser
MYSQL_PASSWORD=mysqlpass
MYSQL_DATABASE=archivetube
```

Now you can begin development simply by typing `now dev`. The app will open on `localhost:3000`.

### Project structure

An overview of the file structure:

* `api/` - endpoints that interface with the database and return JSON
* `lib/` - various libraries and utilities
* `components/` - building blocks used in the pages
* `migrations/` - incremental SQL files used to ensure database schema compatibility
* `pages/` - components each representing a specific URL
* `static/` - static files (stylesheets, images, etc.)

### Copyright

© 2019. [MIT licensed.](https://opensource.org/licenses/MIT)
