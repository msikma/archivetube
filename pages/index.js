// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import React from 'react'

import Head from 'next/head'
import Link from 'next/link'
import LayoutMain from '../components/LayoutMain'
import { apiReq } from '../lib/req'

export default class IndexPage extends React.Component {
  static async getInitialProps({ req, query }) {
    return await apiReq(req, 'users.js', { page: query.page || 1, limit: query.limit || 9 })
  }

  render() {
    const { users, userCount, page, limit, pageCount } = this.props
    console.log(this.props);
    return (
      <LayoutMain>
        <h1>Test Application index page</h1>
        <p>Count: { userCount }</p>
        <p>Page: { page }/{ pageCount }, { limit } per page</p>
      </LayoutMain>
    )
  }
}
