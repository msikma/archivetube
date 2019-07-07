// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import { query } from '../../lib/db'
const sql = require('sql-template-strings')

module.exports = async (req, res) => {
  const [profile] = await query(sql`
    SELECT *
    FROM profiles
    WHERE id = ${req.query.id}
  `)
  res.status(200).json({ profile })
}
