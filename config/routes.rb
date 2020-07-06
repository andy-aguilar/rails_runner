Rails.application.routes.draw do
  resources :runs, only: :index
  resources :brands, only: :index
  resources :shoes, only: :index
  resources :runners, only: :index

  root "welcome#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
