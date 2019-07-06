// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import fetch from 'isomorphic-unfetch'
import Head from 'next/head'

ProfilePage.getInitialProps = async ({ req, query }) => {
  const protocol = req
    ? `${req.headers['x-forwarded-proto']}:`
    : location.protocol
  const host = req ? req.headers['x-forwarded-host'] : location.host
  const pageRequest = `${protocol}//${host}/api/profiles/${query.id}`
  const res = await fetch(pageRequest)
  const json = await res.json()
  return json
}

function ProfilePage({ profile }) {
  return (
    <>
      <Head>
        <title>{profile.name}'s Profile</title>
      </Head>
      <div>
        <h1>Another test</h1>
      </div>
    </>
  )
}

export default ProfilePage
