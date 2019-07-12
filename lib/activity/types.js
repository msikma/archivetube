// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

export const namespace = 'sysmsg'

export default {
  // Any changes to 'profile' other than 'settings'
  changedUserDetails: null,
  // Changes to 'profile.settings'
  changedUserSettings: null,
  // Changes to 'channel.layout'
  changedChannelLayout: null,
  // Changes to 'channel.settings'
  changedChannelSettings: null,
  // When posting a new comment on a channel or video
  postedComment: null,
  // When setting an uploaded video to 'public'
  postedPublicVideo: null,
  // When a user subscribes to a channel
  subscribedToChannel: null,
  // When a user subscribes to a playlist
  subscribedToPlaylist: (user, pl) => `${user} subscribed to ${pl}`,
  // When a user subscribes to a video group
  subscribedToVideoGroup: (user, pl) => `${user} subscribed to ${pl}`,
  // When a user friends another user
  friendedUser: null,
  // When a user uploads a video (regardless of publication status)
  uploadedVideo: null,
  // When a user is banned automatically via a system process (temporarily)
  bannedUserBySystemTemp: null,
  // When a user is manually banned (temporarily)
  bannedUserByAdminTemp: null,
  // When a user is banned automatically via a system process (permanently)
  bannedUserBySystemPerm: null,
  // When a user is manually banned (permanently)
  bannedUserByAdminPerm: null,
}
