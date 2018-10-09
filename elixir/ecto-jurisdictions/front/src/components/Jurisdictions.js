import React, { Component } from 'react';
import { Button, Icon, Label } from 'semantic-ui-react'
import { Table, Flag } from 'semantic-ui-react'

class BaseComponent extends Component {

  render = () => {
    const rows = this.props.jurisdictions.map((entry, index) => (
      <div key={index}>{ entry[0] }</div>
    ))

    const content = (
      <div>


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

          </Table.Cell>
          <Table.Cell>{country[0]}</Table.Cell>
          <Table.Cell>{country[1]}</Table.Cell>
        </Table.Row>
      ))}
    </Table.Body>
  </Table>

        <Button onClick={ this.props.previousPage } content='Prev' icon='left arrow' labelPosition='left' />
        <Button>{ this.props.pageNumber } / { this.props.totalPages }</Button>
        <Button onClick={ this.props.nextPage } content='Next' icon='right arrow' labelPosition='right' />

      </div>
    )
    return content
  }
}

export default BaseComponent;
