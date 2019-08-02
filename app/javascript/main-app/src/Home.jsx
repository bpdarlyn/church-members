import React, { Component } from 'react';
import App from './App';
import {BrowserRouter} from 'react-router-dom';
import {Provider} from 'react-redux'
import { configureStore } from './store/configureStore'

const store = configureStore();
class Home extends Component{

  componentDidMount(){
  }

  render(){
    return(
      <Provider store={store}>
        <BrowserRouter>
          <App/>
        </BrowserRouter>
      </Provider>
    );
  }
}

export default Home;

