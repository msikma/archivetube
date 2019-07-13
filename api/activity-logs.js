// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import { selectQuery } from '../lib/db/query'

export default async function(req, res) {
  const data = await selectQuery(req, 'activity_logs')
  res.status(200).json(data)
}
