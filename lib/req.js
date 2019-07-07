// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import fetch from 'isomorphic-unfetch'
import { objToParams } from './query'

export function apiURL(protocol, host, path, query) {
  return `${protocol}//${host}/api/${path}?${objToParams(query)}`
}

export async function apiReq(req, path, query) {
  const protocol = req ? `${req.headers['x-forwarded-proto']}:` : location.protocol
  const host = req ? req.headers['x-forwarded-host'] : location.host
  const pageRequest = apiURL(protocol, host, path, query)
  const res = await fetch(pageRequest)
  const json = await res.json()
  return json
}
