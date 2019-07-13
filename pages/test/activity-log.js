// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import React from 'react'

export default class TestActivityLog extends React.Component {
  static async getInitialProps({ req, query }) {
    return { a: 'a', b: 'b' }
  }

  render() {
    console.log('test', this.props)
    return (
      <div>
        <p>test</p>
      </div>
    )
  }
}
