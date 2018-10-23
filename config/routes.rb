Rails.application.routes.draw do
  get '/test_update/', to: 'visitors#test_update'
  get '/detail/', to: 'visitors#detail'
  get '/show_tags/', to: 'visitors#show_tags'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
