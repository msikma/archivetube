// ArchiveTube <https://github.com/msikma/archivetube>
// © MIT license

import App, { Container } from 'next/app'
import Head from 'next/head'
import React from 'react'

import 'normalize.css'
import '../static/style.css'

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
        <Component { ...pageProps } />
      </Container>
    )
  }
}
