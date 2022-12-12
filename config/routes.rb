Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "organisations#index"

  devise_for :users

  resources :organisations, except: [:show] do
    resources :software_instances, shallow: true, path: :software
  end
end
