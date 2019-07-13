// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import { formatRelative, formatDistance } from 'date-fns'
import ja from 'date-fns/locale/ja'

export const locales = {
  ja,
  en: null
}
export const locale = locales.en

/** Return relative time between two dates, e.g. 'less than 20 seconds ago' */
export function timeRel(time) {
  const date = new Date(time)
  return formatRelative(date, new Date(), { locale })
}

/** Return distance between two dates, e.g. 'last Friday, 20:03:30' */
export function timeDist(time) {
  const date = new Date(time)
  return formatDistance(date, new Date(), { addSuffix: true, locale })
}
