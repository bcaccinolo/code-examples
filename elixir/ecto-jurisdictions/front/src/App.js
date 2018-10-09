import React, { Component } from 'react';
import JurisdictionsContainer from './components/JurisdictionsContainer';
import './App.css';

import { Header, Icon, Container } from 'semantic-ui-react'

class App extends Component {
  render() {
    return (
      <div className="App">

   <Header as='h1'  icon textAlign='center'>
      <Icon name='flag outline' circular />
      <Header.Content>Jurisdictions
      </Header.Content>

    </Header>

    <Container>
        <JurisdictionsContainer />
    </Container>
      </div>
    );
  }
}

export default App;
