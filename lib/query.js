// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

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
