import React, { Component } from 'react';
import { Icon, Input } from 'semantic-ui-react'

class BaseComponent extends Component {

  render = () => {
    const content = (
      <div>
        <Input onChange={this.props.onChange} placeholder='Search...'  iconPosition='left'>
        <Icon name='search' />
        <input />
        </Input>
      </div>
    )
    return content
  }
}

export default BaseComponent;
