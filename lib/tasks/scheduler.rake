desc "update iNaturalist data"
task :update_inaturalist_data => :environment do
  data = InaturalistService.observations("desc", "created_at", 1)
  total_results = data["total_results"]
  do_it_times = total_results / 30 + 1
  do_it_times.times.each_with_index do |time, index|
    page = index + 1
    data = InaturalistService.observations("desc", "created_at", page)
    results = data["results"]
    results.each do |result|
      if result["photos"].count > 0
        observation = Observation.find_or_create_by(inaturalist_id: result["id"])
        observation.uri = result["uri"] if result["uri"].present?
        observation.description = result["description"] if result["description"].present?
        observation.user_login = result["user"]["login"] if result["user"]["login"].present?
        observation.user_icon = result["user"]["icon"] if result["user"]["icon"].present?
        observation.observed_at = result["time_observed_at"].to_datetime if result["time_observed_at"].present?

        if result["taxon"].present?
          observation.wikipedia_url = result["taxon"]["wikipedia_url"]

          taxon_name = result["taxon"]["name"]
          chinese_taxon_name = WikipediaService.get_chinese_taxon_name(taxon_name)
          observation.taxon_name = taxon_name
          observation.chinese_taxon_name = chinese_taxon_name

          category_name = result["taxon"]["iconic_taxon_name"]
          observation.category_name = category_name
          category = Category.find_or_create_by(name: category_name)
          observation.category = category if observation.category.nil?
        end

        if result["location"].present?
          observation.latitude = result["location"].split(",").first.to_f
          observation.longitude = result["location"].split(",").last.to_f
        end

        observation.save(validate: false)

        if result["photos"].present?
          result["photos"].each do |photo|
            old_photo = observation.photos.find_by(url: photo["url"])
            if old_photo.nil?
              observation.photos.create(url: photo["url"])
            end
          end
        end

        puts "observation: #{observation.id} update finisth"
      end
    end
    puts "page: #{page} finish"
  end
end

desc "update user information"
task :update_user_information => :environment do
  User.where.not(inaturalist_id: nil).each do |user|
    data = InaturalistService.get_user(user.inaturalist_id)
    user.update(inaturalist_icon_url: data["results"].last["icon"]) if data["results"].last["icon"].present?
    puts "user #{user.inaturalist_login} updated"
  end
end
