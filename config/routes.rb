Rails.application.routes.draw do
  resources :runs
  resources :brands
  resources :shoes
  resources :runners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
