Rails.application.routes.draw do

  #region resources
  resources :admins, :user_credentials
  #endregion

  #region setting
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration' }
  root 'welcome#index'
  #endregion

  #region restrict

  #endregion



end
