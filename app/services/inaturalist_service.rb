class InaturalistService
  require "net/https"
  require "uri"
  require "json"

  INATURALIST_API_URL = "https://api.inaturalist.org/v1/observations"
  NANHU_PROJECT_ID = "1ac02830-8817-404e-a6ab-86027362db9c"
  ORDER = "desc"
  ORDER_BY = "created_at"
  PER_PAGE = "1000"

  def self.search(keyword)
    url = "#{INATURALIST_API_URL}?project_id=#{NANHU_PROJECT_ID}&q=#{keyword}&order=#{ORDER}&order_by=#{ORDER_BY}&per_page=#{PER_PAGE}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    data = JSON.parse(response.body)
    data["results"]
  end

end
