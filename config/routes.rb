Rails.application.routes.draw do
  get '/show_tags/', to: 'visitors#show_tags'
  post '/add_tag', to: 'visitors#add_tag'
  delete '/delete_tag', to: 'visitors#delete_tag'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
