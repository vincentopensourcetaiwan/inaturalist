class ApplicationController < ActionController::Base
  before_action :save_token

  def save_token
    permitted = params.permit(:code)
    attributes = permitted.to_h || {}
    attributes.values
    auth_code = attributes[:code]

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
