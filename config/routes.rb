Rails.application.routes.draw do
  get '/search/', to: 'visitors#search'
  get '/search_results/', to: 'visitors#search_results'
  get '/index/', to: 'visitors#index'
  get '/show_tags/', to: 'visitors#show_tags'
  post '/add_tag', to: 'visitors#add_tag'
  delete '/delete_tag', to: 'visitors#delete_tag'
  root to: 'visitors#search'
end
