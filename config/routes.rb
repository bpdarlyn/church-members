Rails.application.routes.draw do
  #region resources
  resources :admins, :type_of_meetings,
            :type_of_courses, :church_men,:title_obtaineds, :people

  resources :user_credentials do
    get 'new_with_linked_person', on: :collection
    post 'create_with_linked_person', on: :collection
  end
  #endregion

  #region setting
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration' }
  root 'welcome#index'
  #endregion

  #region restrict

  #endregion



end
