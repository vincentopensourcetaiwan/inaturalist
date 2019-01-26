namespace :dev do
  desc 'assign contributor role'
  task assign_contributor_role: :environment do
    User.where.not(inaturalist_id: nil).each do |user|
      user.add_role :contributor
    end
  end


  desc 'update user info'
  task update_user_info: :environment do
    User.where.not(inaturalist_id: nil).each do |user|
      data = InaturalistService.get_user(user.inaturalist_id)
      user.update(inaturalist_icon_url: data["results"].last["icon"]) if data["results"].last["icon"].present?
      puts "user #{user.inaturalist_login} updated"
    end
  end

  desc 'test wikipedia many times'
  task test_wikipedia_many_times: :environment do
    data = InaturalistService.observations("desc", "created_at", 1)
    total_results = data["total_results"]
    do_it_times = total_results / 30 + 1
    do_it_times.times.each_with_index do |time, index|
      page = index + 1
      data = InaturalistService.observations("desc", "created_at", page)
      results = data["results"]
      results.each do |result|
        if result["taxon"].present?
          taxon_name = result["taxon"]["name"]
          chinese_name = WikipediaService.get_chinese_taxon_name(taxon_name)
          if chinese_name.nil?
            puts "#{taxon_name} : X"
          else
            puts "#{taxon_name} : #{chinese_name}"
          end
        else
          puts "no taxon_name"
        end


      end
      puts "page: #{page} finish"
    end
  end

  desc 'wikipedia api'
  task wikipedia_api: :environment do
    url = "https://zh.wikipedia.org/zh-tw/Tsuga chinensis formosana"
    real_url = URI.encode(url)
    uri = URI.parse(real_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    doc = Nokogiri::HTML(response.body)
    name = doc.css("h1").first
    binding.pry
  end

  desc 'iNaturalist observations api'
  task inaturalist_observations_api: :environment do
    data = InaturalistService.observations("desc", "created_at", 1)
  end
end