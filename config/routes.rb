Rails.application.routes.draw do
  resources :admins, only: [:show, :new, :create, :destroy]
  resources :runs
  resources :brands
  resources :shoes
  resources :runners
  resources :runner_shoes, only: [:show, :new, :create, :destroy]

  root "welcome#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#process_login'
  get 'logout', to: 'sessions#logout'
  get 'runner/:id/my_runs', to: 'runners#my_runs', as: 'my_runs'
  get 'runner/:id/my_shoes', to: 'runners#my_shoes', as: 'my_shoes'

end
