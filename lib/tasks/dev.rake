namespace :dev do
  desc 'test_auth'
  task test_auth: :environment do
    require 'rubygems'
    require 'rest_client'
    require 'json'

    site = "https://www.inaturalist.org"
    app_id = Rails.application.secrets.inaturalist[:app_id]
    app_secret = Rails.application.secrets.inaturalist[:app_secret]
    redirect_uri = 'http://localhost:3000/' # you can set this to some URL you control for testing

    # REQUEST AN AUTHORIZATION CODE
    # Your web app should redirect the user to this url. They should see a screen
    # offering them the choice to authorize your app. If they aggree, they will be
    # redirected to your redirect_uri with a "code" parameter
    # url = "#{site}/oauth/authorize?client_id=#{app_id}&redirect_uri=#{redirect_uri}&response_type=code"

    # REQUEST AN AUTH TOKEN
    # Once your app has that code parameter, you can exchange it for an access token:
    # puts "Go to #{url}, approve the app, and you should be redirected to your " +
    #        "redirect_uri. Copy and paste the 'code' param here."
    # print "Code: "
    # auth_code = gets.strip
    # puts


    permitted = params.permit(:code)
    attributes = permitted.to_h || {}
    attributes.values

    # binding.pry
    payload = {
      :client_id => app_id,
      :client_secret => app_secret,
      :code => attributes[:code],
      :redirect_uri => redirect_uri,
      :grant_type => "authorization_code"
    }
    puts "POST #{site}/oauth/token, payload: #{payload.inspect}"
    # binding.pry
    puts response = RestClient.post("#{site}/oauth/token", payload)
    # puts
    # response will be a chunk of JSON looking like
    # {
    #   "access_token":"xxx",
    #   "token_type":"bearer",
    #   "expires_in":null,
    #   "refresh_token":null,
    #   "scope":"write"
    # }

    # Store the token (access_token) in your web app. You can now use it to make authorized
    # requests on behalf of the user, like retrieving profile data:
    token = JSON.parse(response)["access_token"]
    # headers = { "Authorization" => "Bearer #{token}" }
    # puts "GET /users/edit.json, headers: #{headers.inspect}"
    # puts RestClient.get("#{site}/users/edit.json", headers)
    # puts

    puts token
    binding.pry
  end


  desc 'observation'
  task observation: :environment do
    require "net/https"
    require "uri"
    require 'json'

    uri = URI.parse("https://api.inaturalist.org/v1/observations?project_id=1ac02830-8817-404e-a6ab-86027362db9c&user_id=yangsheng&page=1&per_page=1&order=desc&order_by=created_at")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    data = JSON.parse(response.body)

  end

  desc 'get observation'
  task get_observation: :environment do
    require 'net/http'
    require 'uri'
    require 'rubygems'
    require 'json'
    request = Net::HTTP.get URI('https://api.inaturalist.org/v1/observations/15778050')
    data = JSON.parse(request)

  end

  desc 'test'
  task test: :environment do
    require 'net/http'
    require 'uri'
    require 'rubygems'
    require 'json'
    response = Net::HTTP.get URI('https://api.inaturalist.org/v1/observations?project_id=1ac02830-8817-404e-a6ab-86027362db9c&page=1&per_page=1&order=desc&order_by=created_at')
    data = JSON.parse(response)

  end

end