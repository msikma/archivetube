// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

const db = require('../../lib/db')
const sql = require('sql-template-strings')

module.exports = async (req, res) => {
  const [profile] = await db.query(sql`
    SELECT *
    FROM profiles
    WHERE id = ${req.query.id}
  `)
  res.status(200).json({ profile })
}
