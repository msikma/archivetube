// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import App, { Container } from 'next/app'
import Head from 'next/head'
import React from 'react'
import styled, { ThemeProvider } from 'styled-components'

import 'normalize.css'
import '../static/style.css'

// Theme definition - affects the whole site's styling.
const theme = {
  // Base variables are only used in this _app wrapper, not in other components.
  base: {
    fontFamily: 'Arial'
  },
  colors: {
    primary: '#0070f3'
  }
}

// Styles that are applied to the whole site globally.
const BaseStyles = styled.div`
  font-family: ${({ theme }) => theme.base.fontFamily};
`

export default class MyApp extends App {
  static async getInitialProps({ Component, ctx }) {
    let pageProps = {}
    if (Component.getInitialProps) {
      pageProps = await Component.getInitialProps(ctx)
    }
    return { pageProps }
  }

  render() {
    const { Component, pageProps } = this.props
    return (
      <Container>
        <Head>
          <meta charSet="utf-8" />
          <meta name="viewport" content="initial-scale=1.0, width=device-width" />
          <title>ArchiveTube</title>
        </Head>
        <ThemeProvider theme={ theme }>
          <BaseStyles>
            <Component { ...pageProps } />
          </BaseStyles>
        </ThemeProvider>
      </Container>
    )
  }
}
