Rails.application.routes.draw do
  resources :runs
  resources :brands
  resources :shoes, only: [:index, :show]
  resources :runners
  resources :runner_shoes, only: [:show, :new, :create]

  root "welcome#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#process_login'
  get 'logout', to: 'sessions#logout'

end
