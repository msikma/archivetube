// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import React from 'react'

import Head from 'next/head'
import Link from 'next/link'
import LayoutMain from '../components/LayoutMain'
import { apiReq } from '../lib/db/req'
import { queryPage } from '../lib/pagination'

export default class IndexPage extends React.Component {
  static async getInitialProps({ req, query }) {
    return await apiReq(req, 'activity-logs.js', queryPage(query.page, query.limit))
  }

  render() {
    return (
      <LayoutMain>
        <h1>Test Application index page</h1>
        <p>sd</p>
      </LayoutMain>
    )
  }
}
