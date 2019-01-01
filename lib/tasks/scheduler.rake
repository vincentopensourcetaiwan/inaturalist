desc "update iNaturalist dat"
task :update_inaturalist_data => :environment do
    url = "#{InaturalistService::API_URL}?project_id=#{InaturalistService::NANHU_PROJECT_ID}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    data = JSON.parse(response.body)
    total_results = data["total_results"]
    do_it_times = total_results / 30 + 1

    do_it_times.times.each_with_index do |time, index|
      page = index + 1
      url = "#{InaturalistService::API_URL}?project_id=#{InaturalistService::NANHU_PROJECT_ID}&order=#{InaturalistService::ORDER}&order_by=#{InaturalistService::ORDER_BY}&page=#{page}"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      data = JSON.parse(response.body)
      results = data["results"]
      results.each do |result|
        observation = Observation.find_or_create_by(inaturalist_id: result["id"])
        observation.uri = result["uri"] if result["uri"].present?
        observation.photo_url = result["photos"].first["url"] if result["photos"].present?
        observation.taxon_name = result["taxon"]["name"] if result["taxon"].present?
        observation.description = result["description"] if result["description"].present?
        observation.user_login = result["user"]["login"] if result["user"]["login"].present?
        observation.user_icon = result["user"]["icon"] if result["user"]["icon"].present?
        observation.save
        puts "observation: #{observation.id} update finisth"
      end
      puts "page: #{page} finish"
    end
end
