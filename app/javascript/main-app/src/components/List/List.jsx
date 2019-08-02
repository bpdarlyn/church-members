import React, { Component } from 'react'
import './styles.css'
export default class List extends Component {
  
  constructor(props) {
    super(props);
    this.state = {
        cars: []
    };
  }

  componentDidMount = () => {
      fetch('https://api.unsplash.com/search/photos/?query=cars&page=1&client_id=' + '09dc34581dea45a82d7c85ec92b8956d76750e7d86fc1ba56b0b162398cd120b')
        .then(res => res.json())
        .then(data => {
          this.setState({ cars: data.results });
          // console.log(data[0].urls.full)
        })
        .catch(err => {
          console.log('Error happened during fetching!', err);
        });
  }

  render() {

    const listItems = this.state.cars.map((car) =>
      <li class="list-item col-6 text-center py-3">
          <div class="card">
                <img src={car.urls.regular} height={300} width={'100%'}/>
            <div class="card-footer">{car.alt_description}</div>
          </div>
      </li>
      );

      return (
          <div className="content">
                <div class="col-12 container">
                  <ul class="list-unstyled row">

                    {listItems}
                    
                  </ul>
              </div>
          </div>

          
      )
  }

}
