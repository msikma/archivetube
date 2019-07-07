const withCSS = require('@zeit/next-css')

module.exports = withCSS({
  target: 'serverless',
  cssLoaderOptions: {
    url: false
  }
})
