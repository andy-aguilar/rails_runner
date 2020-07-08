Rails.application.routes.draw do
  resources :runs, only: [:index, :show, :create, :destroy]
  resources :brands
  resources :shoes, only: [:index, :show]
  resources :runners
  resources :runner_shoes, only: [:show, :new, :create]

  root "welcome#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "runs/new/:id", to: 'runs#new', as: 'new_run' 

  get 'user/runner/new', to: 'users#new_user_runner', as: 'new_user_runner'
  post 'user/runner/create', to: 'users#create_user_runner', as: 'create_user_runner'
  
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#process_login'
  get 'logout', to: 'sessions#logout'

end
