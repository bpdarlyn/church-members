import React, { Component } from 'react'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import './styles.css'
import es from 'date-fns/locale/es';

export default class DateRange extends Component {

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
              <div className="d-flex justify-content-start range">

                <div className="form-group space-range search-field ">
                  <input type="text" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Calle Cochabamba, Av Irala"/>
                </div>

                <div className="space-range">
                  <DatePicker className="form-control"
                    locale={es}
                    selected={this.state.startDate}
                    onChange={this.handleChangeStart}
                  />
                </div>

                <div className="space-range">
                  <DatePicker className="form-control"
                    locale={es}
                    selected={this.state.endDate}
                    onChange={this.handleChangeEnd}
                  >
                    {/* <Text>LAL</Text> */}

                  </DatePicker>
                </div>

              </div>
        )
    }
}

