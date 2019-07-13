// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import knownCodes, { namespace } from './types'
import { snakeToCamel } from '../params'

export default function expandLog(logObj) {
  if (!logObj || Object.keys(logObj).length === 0) return {}
  const code = snakeToCamel(logObj.code)
  const logFn = knownCodes[code]
  if (!logFn) return code
  if (!logObj.namespace === namespace) return code

  const userParent = logObj.userIdParent || null
  const userChild = logObj.userIdChild || null
  const video = logObj.videoId || null
  const group = logObj.videoGroupId || null
  const comment = logObj.commentId || null
  const channel = logObj.channelId || null

  return logFn({ userParent, userChild, video, group, comment, channel });
}
