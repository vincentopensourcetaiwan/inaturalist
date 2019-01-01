class InaturalistService
  require "net/https"
  require "uri"
  require "json"

  API_TOKEN_URL = "https://www.inaturalist.org/users/api_token"
  API_URL = "https://api.inaturalist.org/v1/observations/"
  NANHU_PROJECT_ID = "1ac02830-8817-404e-a6ab-86027362db9c"
  ORDER = "desc"
  ORDER_BY = "created_at"

  def self.observations
    url = "#{API_URL}?project_id=#{NANHU_PROJECT_ID}&order=#{ORDER}&order_by=#{ORDER_BY}"
    get_data(url)
  end

  def self.search_observations(keyword)
    url = "#{API_URL}?project_id=#{NANHU_PROJECT_ID}&q=#{keyword}&order=#{ORDER}&order_by=#{ORDER_BY}"
    get_data(url)
  end

  def self.show_observation(observation_id)
    url = "#{API_URL}#{observation_id}"
    get_data(url)
  end

  def self.update_observation_description(observation_id, description, api_token)
    url = "#{API_URL}#{observation_id}"
    uri = URI.parse(url)
    request = Net::HTTP::Put.new(uri)
    request.content_type = "application/json"
    request["Accept"] = "application/json"
    request["Authorization"] = api_token
    request.body = JSON.dump({
                               "ignore_photos" => 1,
                               "observation" => {
                                 "description" => description
                               }
                             })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

  def self.get_api_token(token)
    url = API_TOKEN_URL
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = "Bearer #{token}"
    response = http.request(request)
    data = JSON.parse(response.body)
    data["api_token"]
  end

  def self.get_data(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    JSON.parse(response.body)
  end

end
