// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import { runQuery } from '../lib/db'
import sql from 'sql-template-strings'

export default async function(req, res) {
  const { query } = req
  const page = Math.max(query.page, 1)
  const limit = Math.min(query.limit, 20)
  const users = await runQuery(sql`
    select *
    from users
    limit ${(page - 1) * limit}, ${limit}
  `)
  const count = await runQuery(`
    select count(*)
    as userCount
    from users
  `)
  const { userCount } = count[0] || {}
  const pageCount = Math.ceil(userCount / limit)
  res.status(200).json({ users, page, limit, userCount, pageCount })
}
