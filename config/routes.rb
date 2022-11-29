Rails.application.routes.draw do
  devise_for :users
  resources :organisations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "organisations#index"
end
