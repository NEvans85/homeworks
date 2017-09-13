import React from "react";

import GiphysIndexItem from "./giphys_index_item";

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    console.log(this.props);
    return (
      <ul>
        {this.props.giphys.map(giphy => {
          <GiphysIndexItem key={giphy.id} giphy={giphy} />;
        })}
      </ul>
    );
  }
}

export default GiphysIndex;
