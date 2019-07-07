// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import Logo from '../Logo'
import NavTop from '../NavTop'
import SearchBar from '../SearchBar'
import ButtonUpload from '../ButtonUpload'
import MenuUser from '../MenuUser'

/** Layout wrapper for regular pages, such as home, profile, video, etc. */
export default ({ children }) => (
  <div>
    <NavTop>
      <Logo />
      <SearchBar />
      <ButtonUpload />
      <MenuUser />
    </NavTop>
    <div>
      { children }
    </div>
  </div>
)
