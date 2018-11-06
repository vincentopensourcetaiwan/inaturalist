class VisitorsController < ApplicationController
  require "net/https"
  require "uri"
  require "json"

  def detail
    url = "https://api.inaturalist.org/v1/observations/17512346"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    # request['Authorization'] = "Bearer #{token}"
    response = http.request(request)
    data = JSON.parse(response.body)
    # binding.pry
  end

  def test_update
    token = session[:token]

    url = "https://www.inaturalist.org/users/api_token"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = "Bearer #{token}"
    response = http.request(request)
    data = JSON.parse(response.body)
    api_token = data["api_token"]


    uri = URI.parse("https://api.inaturalist.org/v1/observations/17765492")
    request = Net::HTTP::Put.new(uri)
    request.content_type = "application/json"
    request["Accept"] = "application/json"
    request["Authorization"] = api_token
    request.body = JSON.dump({
                               "ignore_photos" => 1,
                               "observation" => {
                                 "description" => "qwe, 789, ooo"
                               }
                             })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    data = JSON.parse(response.body)
  end

  def index
    permitted = params.permit(:keyword)
    attributes = permitted.to_h || {}
    attributes.values

    @keyword_string = attributes[:keyword]
    if (@keyword_string.nil?) || (@keyword_string == "")
      @resutls = []
    else
      convert = { :url => attributes[:keyword] }.to_query
      keyword = convert.split("=")[1]
      url = "https://api.inaturalist.org/v1/observations?project_id=1ac02830-8817-404e-a6ab-86027362db9c&q=#{keyword}&order=desc&order_by=created_at&per_page=1000"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)
      data = JSON.parse(response.body)
      @observations = data["results"]
      # binding.pry
    end

    permitted = params.permit(:keyword)
    attributes = permitted.to_h || {}
    attributes.values

    @keyword_string = attributes[:keyword]
    if (@keyword_string.nil?) || (@keyword_string == "")
      @resutls = []
    else
      convert = { :url => attributes[:keyword] }.to_query
      keyword = convert.split("=")[1]
      url = "https://api.inaturalist.org/v1/observations?project_id=1ac02830-8817-404e-a6ab-86027362db9c&q=#{keyword}&order=desc&order_by=created_at&per_page=1000"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)
      data = JSON.parse(response.body)
      @resutls = data["results"]
      # binding.pry
    end

  end

  def show_tags
    permitted = params.permit(:observation_id)
    attributes = permitted.to_h || {}
    attributes.values

    @observation_id = attributes[:observation_id]

    url = "https://api.inaturalist.org/v1/observations/#{@observation_id}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    # request['Authorization'] = "Bearer #{token}"
    response = http.request(request)
    data = JSON.parse(response.body)
    @tags = data["results"].last["description"]

  end
end