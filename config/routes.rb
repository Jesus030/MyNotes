Rails.application.routes.draw do
  resources :collection_notes
  resources :notes
  resources :image
  #devise_for :users, controllers: { sessions: 'custom_session' }

  devise_for :users
  resources :users do 
    member do
      post :send_friend_request
    end
  end
    
  post 'collections/:id/add_note', to: 'collections#add_note', as: 'add_note_collection'
  get 'friendship/request', as: :friend
  post 'friendship/index',  as: :friendships
  get '/friendship/index', to: 'friendship#index'

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
