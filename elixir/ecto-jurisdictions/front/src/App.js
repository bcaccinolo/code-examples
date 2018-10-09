import React, { Component } from 'react'
import { Header, Icon } from 'semantic-ui-react'

import JurisdictionsContainer from './containers/JurisdictionsContainer'
import Footer from './components/Footer'

import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">

        <Header as='h1'  icon textAlign='center'>
          <Icon name='flag outline' circular />
          <Header.Content>Jurisdictions</Header.Content>
        </Header>

        <JurisdictionsContainer />

        <Footer />
      </div>
    );
  }
}

export default App;
