// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import sql from 'sql-template-strings'

import { runQuery } from '.'
import { queryPage } from '../pagination'
import { objSnakeToCamel } from '../params'

/**
 * Generic select query for retrieving the latest rows from a table.
 * 
 * The rows are returned as 'entities' and optionally includes
 * a total count as 'entityCount'. If counting is off, both
 * 'entityCount' and 'pageCount' will be null.
 */
export async function selectQuery(req, table, addCount = true) {
  const { query } = req
  const { page, limit } = queryPage({ query: query.page, limit: query.limit });

  const entitiesRaw = await runQuery(sql`
    select *
    from `.append(table).append(sql`
    limit ${(page - 1) * limit},${limit};
  `))
  const entities = entitiesRaw.map(e => objSnakeToCamel({ ...e }))

  let pageCount = null
  let entityCount = null
  let countValue = null
  if (addCount) {
    entityCount = await runQuery(sql`
      select count(*)
      as entityCount
      from `.append(table)
    )
    countValue = entityCount[0] && entityCount[0].entityCount || 0
    pageCount = Math.ceil(countValue / limit)
  }

  return {
    meta: {
      page,
      pageLimit: limit,
      pageCount
    },
    entities,
    entityCount: countValue
  }
}
