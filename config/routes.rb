Rails.application.routes.draw do
  resources :collections
  resources :notes
  resources :image
  #devise_for :users, controllers: { sessions: 'custom_session' }

  devise_for :users
  resources :users do 
    member do
      post :send_friend_request
    end
  end
  
  get '/ver_notas', to: 'notes#ver_notas', as: 'ver_notas'
  get '/ver_notas_title', to: 'notes#ver_notas_title', as: 'ver_notas_title'

  get '/friends_notes', to: 'notes#friends_notes', as: 'friends_notes'
  get '/own_notes', to: 'notes#own_notes', as: 'own_notes'
  get '/your_friends', to: 'friendship#your_friends'
  get '/possible_friends', to: 'friendships#possible_friends', as: 'possible_friends'
  get '/share_notes', to: 'notes#share_notes', as:  'share_note'
  

  get '/share_user', to: 'notes#share_user', as: 'share_user'
  get '/remove_from_sharing', to: 'notes#remove_from_sharing', as: 'remove_from_sharing'

  post '/delete', to: 'collections#delete', as: 'delete_collection'
  get '/add_note', to: 'collections#add_note', as: 'add_note'
  get '/add',  to: 'collections#add', as: 'add'
 # post 'add_note/:index', to: 'collections#add_note', as: 'add_note'
  get '/remove_from_collection', to: 'collections#remove_from_collection', as: 'remove_from_collection'

 resources :collections do
  #post 'add_note/:index', to: 'collections#add_note', as: 'add_note'
 # post 'add_note', to: 'collections#add_note', as: 'add_note'
end

get '/request', to: 'friendships#request', as: 'request'
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
