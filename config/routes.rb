Rails.application.routes.draw do
  get 'users/new', to: "users#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :users, only: %i[create]
  # Defines the root path route ("/")
  # root "articles#index"
end
