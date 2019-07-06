// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import fetch from 'isomorphic-unfetch'
import Head from 'next/head'
import Link from 'next/link'
import PageTemplate from '../components/PageTemplate'

HomePage.getInitialProps = async ({ req, query }) => {
  const protocol = req
    ? `${req.headers['x-forwarded-proto']}:`
    : location.protocol
  const host = req ? req.headers['x-forwarded-host'] : location.host
  const pageRequest = `${protocol}//${host}/api/profiles?page=${query.page ||
    1}&limit=${query.limit || 9}`
  const res = await fetch(pageRequest)
  const json = await res.json()
  return json
}

function HomePage({ profiles, page, pageCount }) {
  return (
    <>
      <header>
        <h1>Test Application</h1>
      </header>
    </>
  )
}

export default HomePage
