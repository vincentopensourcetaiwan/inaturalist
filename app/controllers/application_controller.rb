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
      app_id = Settings.inaturalist.app_id
      app_secret = Settings.inaturalist.app_secret
      redirect_uri = Settings.inaturalist.redirect_uri
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
        if Rails.env.production?
          link_to_authorization_code = ENV['INATURALIST_LOGIN_URL']
        else
          link_to_authorization_code = Settings.inaturalist.link_to_authorization_code
        end
        redirect_to link_to_authorization_code
      end
    end
  end
end
