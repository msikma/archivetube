// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import changeCase from 'change-case';

/**
 * Converts an object of key/value pairs to URI parameters without leading question mark.
 * By default, we remove: null, empty strings and empty arrays.
 */
export function objToParams(obj, { removeNull = true, removeEmptyString = true, removeEmptyArray = true, removeFalse = false } = {}) {
  return Object.keys(obj)
    // Filter out everything that needs to be filtered out.
    .filter(k =>
      (!removeNull || (removeNull && obj[k] != null)) &&
      (!removeEmptyString || (removeEmptyString && obj[k] !== '')) &&
      (!removeFalse || (removeFalse && obj[k] !== false)) &&
      (!removeEmptyArray || (removeEmptyArray && (!Array.isArray(obj[k]) || obj[k].length > 0))))
    // Encode to URI components. Account for the zero-width array.
    .map(k => Array.isArray(obj[k]) && obj[k].length > 0
      ? obj[k].map(i => `${encodeURIComponent(k)}[]=${encodeURIComponent(i)}`).join('&')
      : `${encodeURIComponent(k)}${Array.isArray(obj[k]) ? '[]' : ''}=${encodeURIComponent(obj[k])}`)
    .join('&')
}

/**
 * Changes snake_case strings to camelCase strings.
 * 
 * The database uses snake_case, and in the models code it's useful
 * to convert these names directly to camelCase.
 */
export function snakeToCamel(snake_var) {
  return changeCase.camelCase(snake_var)
}

/**
 * Changes all keys of an object from snake_case to camelCase.
 */
export function objSnakeToCamel(obj) {
  const newObj = {}
  for (const [key, value] of Object.entries(obj)) {
    newObj[snakeToCamel(key)] = value
  }
  return newObj
}
