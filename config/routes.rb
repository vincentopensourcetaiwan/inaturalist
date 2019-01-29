Rails.application.routes.draw do
  devise_for :users
  get '/search/', to: 'visitors#search'
  get '/search_results/', to: 'visitors#search_results'
  root to: 'visitors#search'

  namespace :admin do
    resources :users
    resources :observations do
      get :edit_user
      post :update_user
    end
    resources :categories
  end

end
