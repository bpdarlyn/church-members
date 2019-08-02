import React, { Component } from 'react'
import './styles.css'

export default class Sidebar extends Component {
   
    render() {
        return (
            <div className="card">
                <div className="card-body">

                    <div className="form-check">
                      <input className="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked/>
                      <label className="form-check-label" for="exampleRadios1">
                          <h1>Abrete Dud</h1>
                          <p className="mini">Ver los vehículos disponibles</p>

                      </label>
                    </div>
                    <hr></hr>

                    <div className="form-check">
                      <input className="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2" checked/>
                      <label className="form-check-label" for="exampleRadios2">
                          <h3>
                            Vehículos que puedes reservar <br/>
                            sin esperar las confirmación <br/>
                            del propietario
                          </h3>
                      </label>
                    </div>

                    
                    <hr></hr>
                    Cateroria
                    <div>

                    </div>
                    <hr></hr>
                    <div className="form-group">
                    <label for="exampleFormControlSelect1">Número de asientos</label>
                    <select className="form-control" id="exampleFormControlSelect1">
                        <option>Todos</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                    </div>

                    <div className="form-group">
                    <label for="exampleFormControlSelect1">Años del vehículo</label>
                    <select className="form-control" id="exampleFormControlSelect1">
                        <option>Todos</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                    </div>
                    <div className="form-group">
                    <label for="exampleFormControlSelect1">Tipo de caja</label>
                    <div className="custom-control custom-checkbox">
                        <input type="checkbox" className="custom-control-input" id="customCheck1"/>
                        <label className="custom-control-label" for="customCheck1">Mecanica</label>
                    </div>
                    <div className="custom-control custom-checkbox">
                        <input type="checkbox" className="custom-control-input" id="customCheck2"/>
                        <label className="custom-control-label" for="customCheck2">Automatica</label>
                    </div>
                    </div>  

                    

                </div>
        </div>
        )
    }
}

