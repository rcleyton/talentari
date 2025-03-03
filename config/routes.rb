Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  root        to: "site/welcome#index"
  get "home", to: "site/welcome#index"

  get  "companies/signup", to: "companies/signup#new"
  post "companies/signup", to: "companies/signup#create"
end
