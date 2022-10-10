Rails.application.routes.draw do
  get "users/show", to: "users#show"
  get "/sign_in", to: "session#new"
  get "/sign_out", to: "session#destroy"
  post "session", to: "session#create"
  get "users", to: "users#index"
  get "register", to: "users#new"
  post "users", to: "users#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users, only: %i[create]
  # Defines the root path route ("/")
  # root "articles#index"
end
