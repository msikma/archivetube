import React from 'react';
import Error from 'next/error';
import fetch from 'isomorphic-unfetch';

class Page extends React.Component {
  static async getInitialProps() {
    const res = await fetch('https://api.github.com/repos/zeit/next.js');
    const errorCode = res.statusCode > 200 ? res.statusCode : false;
    const json = await res.json();

    return { errorCode, stars: json.stargazers_count };
  }

  render() {
    if (this.props.errorCode) {
      return <Error statusCode={this.props.errorCode} />;
    }

    return <div>Next stars: {this.props.stars}</div>;
  }
}

export default Page;
