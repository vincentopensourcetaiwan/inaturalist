class InaturalistService
  API_TOKEN_URL = "https://www.inaturalist.org/users/api_token"
  API_URL = "https://api.inaturalist.org/v1/"
  OBSERVATIONS_API_URL = "#{API_URL}observations/"
  USERS_API_URL = "#{API_URL}users/"
  NANHU_PROJECT_ID = "1ac02830-8817-404e-a6ab-86027362db9c"
  ORDER = "desc"
  ORDER_BY = "created_at"

  def self.get_user(inaturalist_id)
    url = "#{USERS_API_URL}#{inaturalist_id}"
    get_data(url)
  end

  def self.observations(order, order_by, page)
    url = "#{OBSERVATIONS_API_URL}?project_id=#{NANHU_PROJECT_ID}&order=#{order}&order_by=#{order_by}&page=#{page}"
    get_data(url)
  end

  def self.search_observations(keyword, order, order_by, page)
    url = "#{OBSERVATIONS_API_URL}?project_id=#{NANHU_PROJECT_ID}&q=#{keyword}&order=#{order}&order_by=#{order_by}&page=#{page}"
    get_data(url)
  end

  def self.show_observation(observation_id)
    url = "#{OBSERVATIONS_API_URL}#{observation_id}"
    get_data(url)
  end

  def self.update_observation_description(observation_id, description, api_token)
    url = "#{OBSERVATIONS_API_URL}#{observation_id}"
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
    data = get_data(url)
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
