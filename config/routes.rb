Rails.application.routes.draw do
  resources :people
  resources :rooms
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
