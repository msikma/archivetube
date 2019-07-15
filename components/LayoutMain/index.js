// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import Head from 'next/head'
import styled from 'styled-components'

import Logo from '../Logo'
import NavTop from '../NavTop'
import SearchBar from '../SearchBar'
import ButtonUpload from '../ButtonUpload'
import MenuTop from '../MenuTop'
import TestNav from '../TestNav'

const LayoutMain = styled.div`
  background: #f2eefb;
`

// Send half of the top menu to the right.
const NavTopRight = styled.header`
  justify-content: flex-end;
`

/** Layout wrapper for regular pages, such as home, profile, video, etc. */
export default ({ children, pageTitle }) => (
  <LayoutMain>
    { pageTitle && (
      <Head>
        <title>{ pageTitle } - ArchiveTube</title>
      </Head>
    ) }
    <NavTop>
      <Logo />
      <NavTopRight>
        <SearchBar />
        <ButtonUpload />
        <TestNav />
        <MenuTop />
      </NavTopRight>
    </NavTop>
    <main>
      { children }
    </main>
  </LayoutMain>
)
