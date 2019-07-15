// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import Link from 'next/link'
import styled from 'styled-components'

const A = styled.a`
  color: white;

  :hover {
    cursor: pointer;
  }
`

export default () => (
  <Link href="/">
    <A>ArchiveTube</A>
  </Link>
)
