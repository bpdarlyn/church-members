Rails.application.routes.draw do
  #region resources
  resources :type_of_meetings, :meetings,
            :type_of_courses, :church_men, :title_obtaineds

  resources :admins do
    get 'generate_meeting_report', on: :collection
    post 'upload_meeting_report', on: :collection
    get 'on_change_select_person', on: :collection
  end

  resources :people do
    get 'generate_meeting_report', on: :collection
    post 'upload_meeting_report', on: :collection
  end

  resources :user_credentials do
    get 'new_with_linked_person', on: :collection
    post 'create_with_linked_person', on: :collection
  end
  #endregion

  #region setting
  devise_for :users, controllers: {sessions: 'users/sessions', registration: 'users/registration'}
  root 'welcome#index'
  #endregion

  #region restrict

  #endregion


end
