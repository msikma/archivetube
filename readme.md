## ArchiveTube

**Note: still heavily under construction and not production ready.**

This app is a Youtube clone designed to use the [Internet Archive](https://archive.org/) as storage backend. It's set up as a [Next.js](https://zeit.co/guides/deploying-nextjs-with-now/) Node project with MySQL for database storage.

### Development

The two prerequisites for this project are **[`now`](https://zeit.co/download)** and **MySQL (or MariaDB)**. The quickest way to install both is via **[Yarn](https://yarnpkg.com/)** and **[Brew](https://brew.sh/)**:

```sh
yarn global add now
brew install mariadb
```

After setting up a user, you'll need to create a database:

```sql
create database archivetube character set utf8mb4 collate utf8mb4_unicode_ci;
```

Now you can begin development simply by typing `now dev`. The app will open on `localhost:3000`.

### Project structure

An overview of the file structure:

* `api/` - abstractions for dealing with the database
* `lib/` - non-HTML related code
* `components/` - building blocks used in the pages
* `migrations/` - incremental SQL files used to ensure database schema compatibility
* `pages/` - components each representing a specific URL
* `static/` - all static files (stylesheets, images, etc.)

Only `components` and `pages` are transpiled, meaning ES2015 `import` syntax can be used only there.

### Copyright

© 2019. [MIT licensed.](https://opensource.org/licenses/MIT)
