import React, { Component } from 'react';
import { Button, Container, Table, Flag, Message } from 'semantic-ui-react'

import Search from './Search';

class BaseComponent extends Component {

  render = () => {

    let pagination_buttons = ""
    if(this.props.totalPages !== null) {
      pagination_buttons = (
        <div>
          <Button onClick={ this.props.previousPage } content='Prev' icon='left arrow' labelPosition='left' />
          <Button>{ this.props.pageNumber } / { this.props.totalPages }</Button>
          <Button onClick={ this.props.nextPage } content='Next' icon='right arrow' labelPosition='right' />
        </div>
      )
    }

    let no_search_result_message = ""
    if(this.props.jurisdictions.length == 0) {
      no_search_result_message = ( <Message icon='search' header='No match found' /> )
    }

    const content = (
      <Container>
        <Search onChange={this.props.onChange}/>
        <Table>
            <Table.Header>
              <Table.Row>
                <Table.HeaderCell>Country</Table.HeaderCell>
                <Table.HeaderCell>Name</Table.HeaderCell>
                <Table.HeaderCell>Country Code</Table.HeaderCell>
              </Table.Row>
            </Table.Header>

            <Table.Body>
              {this.props.jurisdictions.map(country => (
                <Table.Row key={country.countryCode}>
                  <Table.Cell>
                    <Flag name={country[1].toLowerCase()} />
                    {country[1].toLowerCase()}

                  </Table.Cell>
                  <Table.Cell>{country[0]}</Table.Cell>
                  <Table.Cell>{country[1]}</Table.Cell>
                </Table.Row>
              ))}
            </Table.Body>
          </Table>

          {pagination_buttons}

          {no_search_result_message}


      </Container>
    )
    return content
  }
}

export default BaseComponent;
