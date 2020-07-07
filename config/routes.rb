Rails.application.routes.draw do
  resources :runs, only: [:index, :show, :create, :destroy]
  resources :brands, only: [:index, :show]
  resources :shoes, only: [:index, :show]
  resources :runners
  resources :runner_shoes, only: [:show, :new, :create]

  root "welcome#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "runs/new/:id", to: 'runs#new', as: 'new_run' 
end
