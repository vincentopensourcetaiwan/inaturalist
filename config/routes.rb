Rails.application.routes.draw do
  get '/search/', to: 'visitors#search'
  get '/search_results/', to: 'visitors#search_results'
  root to: 'visitors#search'
end
