Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
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
    resources :periods do
      collection do
        get :search
      end
    end
  end

  namespace :apis, constraints: { format: 'json' } do
    namespace :v1 do
      resources :observations, only: [:index]
    end
  end
end
