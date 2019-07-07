// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import mysql from 'serverless-mysql'

// Initializes the database using environment variables.
// Set these in an .env file in the root.
const db = mysql({
  config: {
    host: process.env.MYSQL_HOST,
    database: process.env.MYSQL_DATABASE,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD
  }
})

/** Runs a raw query on the database. */
export const query = async query => {
  try {
    const results = await db.query(query)
    await db.end()
    return results
  }
  catch (error) {
    return { error }
  }
}
