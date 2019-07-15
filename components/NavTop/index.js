// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import styled from 'styled-components'

const NavTopHeader = styled.header`
  padding: 1.5rem 2.75rem;
  justify-content: space-between;
  flex-direction: row;
  align-items: center;
  background: #20123a;
  border-top: 1px solid #2b2156;
`

export default ({ children }) => (
  <NavTopHeader className="NavTop">
    { children }
  </NavTopHeader>
)
