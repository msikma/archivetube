// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import fetch from 'isomorphic-unfetch'
import Head from 'next/head'
import Link from 'next/link'
import LayoutMain from '../components/LayoutMain'

export default class ProfilePage {
  static async getInitialProps({ req, query }) {
    const protocol = req
      ? `${req.headers['x-forwarded-proto']}:`
      : location.protocol
    const host = req ? req.headers['x-forwarded-host'] : location.host
    const pageRequest = `${protocol}//${host}/api/profiles/${query.id}`
    const res = await fetch(pageRequest)
    const json = await res.json()
    return json
  }

  render() {
    return (
      <LayoutMain>
        <Head>
          <title>{profile.name}'s Profile</title>
        </Head>
        <div>
          <h1>Another test</h1>
        </div>
      </LayoutMain>
    )
  }
}
