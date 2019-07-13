// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import React from 'react'

const links = [
  ['/test/activity-log', 'Activity Log']
]

export default class TestNav extends React.Component {
  state = {
    value: ''
  }
  handleChange = (value) => {
    this.setState({ value })
  }
  render() {
    const { value } = this.state
    return (
      <div>
        <select value={ value } onChange={ ev => this.handleChange(ev.target.value) }>
          <option value="_">Test pages</option>
          { links.map((l, n) => (
            <option value={ l[0] } key={ n }>{ l[1] }</option>
          )) }
        </select>
      </div>
    )
  }
}
