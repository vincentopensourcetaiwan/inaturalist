desc "update iNaturalist dat"
task :update_inaturalist_data => :environment do
  data = InaturalistService.observations("desc", "created_at", 1)
  total_results = data["total_results"]
  do_it_times = total_results / 30 + 1
  do_it_times.times.each_with_index do |time, index|
    page = index + 1
    data = InaturalistService.observations("desc", "created_at", page)
    results = data["results"]
    results.each do |result|
      observation = Observation.find_or_create_by(inaturalist_id: result["id"])
      observation.uri = result["uri"] if result["uri"].present?
      observation.photo_url = result["photos"].first["url"] if result["photos"].present?
      observation.wikipedia_url = result["taxon"]["wikipedia_url"] if result["taxon"].present?
      observation.description = result["description"] if result["description"].present?
      observation.user_login = result["user"]["login"] if result["user"]["login"].present?
      observation.user_icon = result["user"]["icon"] if result["user"]["icon"].present?
      if result["taxon"].present?
        taxon_name = result["taxon"]["name"]
        chinese_taxon_name = WikipediaService.get_chinese_taxon_name(taxon_name)
        observation.taxon_name = taxon_name
        observation.chinese_taxon_name = chinese_taxon_name
      end
      if result["location"].present?
        observation.latitude = result["location"].split(",").first.to_f
        observation.longitude = result["location"].split(",").last.to_f
      end
      observation.save
      puts "observation: #{observation.id} update finisth"
    end
    puts "page: #{page} finish"
  end
end
