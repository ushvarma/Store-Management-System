Rails.application.routes.draw do

  resources :special_items
  resources :return_items
  resources :homepages
  devise_for :admins
  resources :adminpages
  resources :items
  resources :items do
  resources :comments
  end
  resources :carts
  resources :wishlists
  resources :orders
  match '/users',   to: 'users#index',via: 'get'
  match "/users/:id" => "users#show", via: 'get'
  match "/users/:id/edit" => "users#edit", via: 'get'
  match "/users/new" => "users#new", via: 'get'
  
  devise_for :users ,:path_prefix => 'my'
  resources :users

  get '/transaction', to: 'transaction#index'
  get '/quicktransaction', to: 'quicktransaction#index'
  get '/returnrequestprocess', to: 'returnrequestprocess#index'
  get '/specialrequestprocess', to: 'specialrequestprocess#index'
  get '/otp', to: 'otp#index'
  get '/clearCart', to: 'clear_cart#index'
  post "otp_enter", to: 'otp#getNum'
  
  root to:"homepages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
