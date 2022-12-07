Rails.application.routes.draw do
  mount GovukPublishingComponents::Engine, at: "/component-guide" if Rails.env.development?

  # Defines the root path route ("/")
  root "organisations#index"

  devise_for :users

  resources :software_instances
  resources :organisations

end
