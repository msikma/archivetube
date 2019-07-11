// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

const runQuery = require('../lib/db')
const sql = require('sql-template-strings')

module.exports = async (req, res) => {
  const { query } = req
  console.log('a')
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
  console.log('---')
  console.log({ users, page, limit, userCount, pageCount })
  res.status(200).json({ a: 'b' })
}
