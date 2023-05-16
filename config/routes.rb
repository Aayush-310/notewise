Rails.application.routes.draw do
  get 'pages/about'
  get 'users/show'
  get 'user/show'
  get '/search', to: 'notes#search'
  
  devise_for :users
  resources :users, only: [:show]
  
  resources :notes do
    post 'share', on: :member
  end
  
  root to: "notes#index"
end
