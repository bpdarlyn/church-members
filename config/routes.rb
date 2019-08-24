Rails.application.routes.draw do
  #region resources
  resources :admins, :user_credentials, :type_of_meetings,
            :type_of_courses, :church_men,:title_obtaineds, :people
  #endregion

  #region setting
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration' }
  root 'welcome#index'
  #endregion

  #region restrict

  #endregion



end
