import { serviceTypes } from '../types'


const initialStateServices = {
  estimage: 0,
  loading: false,
}

export const ServiceReducer = (state = initialStateServices, action) => {
    switch(action.type){
      
      case serviceTypes.GET_ESTIMATE_SUCCESS:
        return{
          ...state,
          loading: false,
        }
      case serviceTypes.GET_ESTIMATE_FAILURE:
        return{
          ...state,
          loading: false,
        }
      default: 
        return state; 
    }
}