Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :notes
 #map.resources :friendships
  root 'dashboard#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
