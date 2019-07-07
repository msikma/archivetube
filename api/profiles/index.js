// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import { query } from '../../lib/db'
const sql = require('sql-template-strings')

export default async (req, res) => {
  let page = parseInt(req.query.page) || 1
  const limit = parseInt(req.query.limit) || 9
  if (page < 1) page = 1
  const profiles = await query(sql`
    SELECT *
    FROM profiles
    LIMIT ${(page - 1) * limit}, ${limit}
  `)
  const count = await query(`
    SELECT COUNT(*)
    AS profilesCount
    FROM profiles
  `)
  const { profilesCount } = count[0]
  const pageCount = Math.ceil(profilesCount / limit)
  res.status(200).json({ profiles, pageCount, page })
}
