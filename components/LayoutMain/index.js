// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import Head from 'next/head'

/** Layout wrapper for regular pages, such as home, profile, video, etc. */
export default ({ children }) => (
  <div>
    <Head>
      <link href="/static/style.css" type="text/css" rel="stylesheet" />
    </Head>
    { children }
  </div>
)
