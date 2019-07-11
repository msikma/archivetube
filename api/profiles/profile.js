// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import { runQuery } from '../../lib/db'
const sql = require('sql-template-strings')

module.exports = async (req, res) => {
  const [profile] = await runQuery(sql`
    SELECT *
    FROM profiles
    WHERE id = ${req.query.id}
  `)
  res.status(200).json({ profile })
}
