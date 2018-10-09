import React, { Component } from 'react';
import axios from 'axios';
import Jurisdictions from '../components/Jurisdictions';

class BaseComponent extends Component {

  constructor(props) {
    super(props);
    this.state = {
      jurisdictions : [],
      page_number: 0,
      total_pages: 0,
      fetching: false
    }
  }

  // once mounted, we refresh the list
  componentDidMount = () => {
    this.jurisdiction_page(1);
  }

  // when the search field is updated
  onChange = (ev, data) => {
    const query = data.value.trim()
    if(query.length == 0) {
      this.jurisdiction_page(1);
    } else {
      this.search(data.value.trim())
    }
  }

  search = (query) => {
    this.setState({fetching: true})
    const url = '/fuzzy/' + query
    axios.get(url)
    .then(response => response.data)
    .then(data => {
      console.log(data)
      this.setState({ jurisdictions: data,
                      total_pages: null })
    })
  }

  jurisdiction_page = (page) => {
    this.setState({fetching: true});
    const url = '/jurisdictions/' + page
    axios.get(url)
    .then(response => response.data)
    .then(data => {
      this.setState({ jurisdictions: data.entries,
                      page_number: data.page_number,
                      total_pages: data.total_pages,
                      fetching: false })
    })
  }

  nextPage = () => {
    if(this.state.page_number + 1 > this.state.total_pages) { return }
    this.jurisdiction_page(this.state.page_number + 1)
  }

  previousPage = () => {
    if(this.state.page_number - 1 <= 0) { return }
    this.jurisdiction_page(this.state.page_number - 1)
  }

  render = () => {
    return (
        <Jurisdictions  jurisdictions={this.state.jurisdictions}
                        pageNumber={this.state.page_number}
                        totalPages={this.state.total_pages}
                        nextPage={this.nextPage}
                        previousPage={this.previousPage}
                        onChange={this.onChange} />
    )
  }
}

export default BaseComponent;
