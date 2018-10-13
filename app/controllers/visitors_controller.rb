class VisitorsController < ApplicationController
  def index
    require "net/https"
    require "uri"
    require "json"

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
end