Rails.application.routes.draw do
  resources :runs, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :shoes, only: [:index, :show]
  resources :runners, only: [:index, :show]
  resources :runner_shoes, only: [:show]

  root "welcome#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
