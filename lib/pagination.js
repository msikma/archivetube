// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

// The default amount of items to show on a page.
const entityLimit = 20

/** Limits a given page number and limit */
export function queryPage(queryValues = {}) {
  const { page, limit, customLimit } = queryValues
  const reqPage = page ? Math.min(page, 1) : 1
  const reqLimit = limit ? Math.max(limit, customLimit || entityLimit) : entityLimit
  return {
    ...queryValues,
    page: reqPage,
    limit: reqLimit
  }
}
