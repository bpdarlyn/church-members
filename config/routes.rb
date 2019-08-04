Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration' }
  root 'welcome#index'
end
