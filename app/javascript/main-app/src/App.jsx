import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Search from './containers/Search'

const NotFound = () => <h1>404.. This page is not found!</h1>


class App extends Component{

  render(){
    return(
      <Router>
        <div>
          <Route exact path='/search' render={()=><Search/>} />
        </div>

      </Router>
    );
  }
}

export default App;
