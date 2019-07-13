// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import fetch from 'isomorphic-unfetch'

import { objToParams, underscoreToDash } from '../params'
import { queryPage } from '../pagination'

/** Turns an object into an array, if all keys are numbers. */
function seqToArray(resultObj) {
  const keys = Object.keys(resultObj)
  const nonNumbers = keys.filter(k => isNaN(Number(k)))
  
  // If there are any non-numeric keys, return the object verbatim.
  if (nonNumbers.length > 0) {
    return resultObj
  }
  // Otherwise, return only the values.
  return Object.values(resultObj)
}

/** Returns a full URL for an API endpoint. */
export function apiURL(protocol, host, path, query) {
  return `${protocol}//${host}/api/${path}?${objToParams(query)}`
}

/** Runs an API request and returns the data in JSON. */
export async function apiReq(req, apiPath, queryValues) {
  // TODO: remove js from API paths
  const path = `${underscoreToDash(apiPath)}.js`
  
  // Limit the page values in the query to sensible values.
  const query = queryPage(queryValues)

  const protocol = req ? `${req.headers['x-forwarded-proto']}:` : location.protocol
  const host = req ? req.headers['x-forwarded-host'] : location.host
  const pageRequest = apiURL(protocol, host, path, query)
  const res = await fetch(pageRequest)
  const json = seqToArray(await res.json())
  return json
}
