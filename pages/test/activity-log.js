// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import React from 'react'

import Head from 'next/head'
import Link from 'next/link'
import LayoutMain from '../../components/LayoutMain'
import { apiReq } from '../../lib/db/req'
import { queryPage } from '../../lib/pagination'
import expandLog from '../../lib/activity'
import { timeRel, timeDist } from '../../lib/time'

export default class TestActivityLog extends React.Component {
  static async getInitialProps({ req, query }) {
    return await apiReq(req, 'activity-logs', queryPage(query))
  }

  render() {
    const { meta, entities, entityCount } = this.props
    return (
      <LayoutMain pageTitle="Activity logs test page">
        { entities.map(entity => {
          const entityMsg = expandLog(entity)
          const timeR = timeRel(entity.timeUtc)
          const timeD = timeDist(entity.timeUtc)
          return (
            <div key={ `log_${entity.id}` }>
              <p>{ timeR }</p>
              <p>{ timeD }</p>
              <p>{ entityMsg }</p>
            </div>
          )
        }) }
        <p>test</p>
      </LayoutMain>
    )
  }
}
