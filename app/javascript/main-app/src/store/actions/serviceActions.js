import { serviceTypes } from '../types'

export const getEstimateSuccess = (response) => { 
  return {  type: serviceTypes.GET_ESTIMATE_SUCCESS, response } 
}

export const getEstimateFailure = (errorMessage)=> { 
  return { type: serviceTypes.GET_ESTIMATE_FAILURE, errorMessage } 
}

