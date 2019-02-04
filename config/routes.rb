Rails.application.routes.draw do
  devise_for :users
  get '/search/', to: 'visitors#search'
  get '/search_advance/', to: 'visitors#search_advance'
  get '/search_results/', to: 'visitors#search_results'
  root to: 'visitors#search'

  namespace :admin do
    resources :users
    resources :observations
    resources :categories
    resources :tags do
      collection do
        get :search
      end
    end
    resources :places do
      collection do
        get :search
      end
    end
  end

end
