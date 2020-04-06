class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  before_action :save_token


  def after_sign_in_path_for(resource)
    admin_observations_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def save_token
    auth_code = params.permit(:code)[:code]

    if auth_code.present?
      require 'rubygems'
      require 'rest_client'
      require 'json'

      site = "https://www.inaturalist.org"
      app_id = ENV['INATURALIST_APP_ID']
      app_secret = ENV['INATURALIST_APP_SECRET']
      redirect_uri = ENV['INATURALIST_REDIRECT_URI']
      payload = {
        :client_id => app_id,
        :client_secret => app_secret,
        :code => auth_code,
        :redirect_uri => redirect_uri,
        :grant_type => "authorization_code"
      }

      begin
        response = RestClient.post("#{site}/oauth/token", payload)
        token = JSON.parse(response)["access_token"]
        session[:token] = token
      rescue
        redirect_to ENV['INATURALIST_LOGIN_URL']
      end

    end

  end

end
