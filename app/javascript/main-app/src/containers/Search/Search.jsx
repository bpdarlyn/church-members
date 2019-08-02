import React, { Component } from 'react'
import './styles.css'
import Sidebar from '../Sidebar'
import List from '../../components/List'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import DateRange from '../DateRange'

export default class Search extends Component {

  constructor(props) {
    super(props);
    this.state = {
      startDate: new Date(),
      endDate : new Date(),
    };
  }

  handleChangeStart = (date) => {
    this.setState({
      startDate: date
    });
  }

  handleChangeEnd = (date) => {
    this.setState({
      endDate: date
    });
  }

  render() {
      return (
          <div className="container-fluid container-search">
              <DateRange/>
              <div className="d-flex justify-content-start search">
                <div className="sidebar">
                  <Sidebar/>
                </div>
                <div className="content">
                  <List/>
                </div>
              </div>

          </div>
          
      )
  }
}

