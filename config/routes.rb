Rails.application.routes.draw do
  get 'pages/about'
  get 'users/show'
  get 'user/show'
  get '/search', to: 'notes#search'
  devise_for :users
  resources :users, only: [:show]
  resources :notes
  root to:"notes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
