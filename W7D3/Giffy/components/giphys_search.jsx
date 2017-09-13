import React from "react";
import GiphysIndex from "./giphys_index";

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: "",
      searchResults: []
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  render() {
    let { giphys } = this.props;
    return (
      <div>
        <form id="giphy-search-form">
          <input
            onChange={this.handleChange}
            type="text"
            value={this.state.searchTerm}
          />
          <input onClick={this.handleSubmit} type="submit" value="Search" />
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    );
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  handleChange(e) {
    e.preventDefault();
    this.setState({ searchTerm: e.target.value });
  }
}
export default GiphysSearch;
