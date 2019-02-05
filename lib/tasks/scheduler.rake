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
      if result["photos"].present?
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
          category = Category.find_or_create_by!(name: category_name)
          observation.category = category if observation.category.nil?
        end

        if result["location"].present?
          observation.latitude = result["location"].split(",").first.to_f
          observation.longitude = result["location"].split(",").last.to_f
        end

        if result["tags"].any?
          result["tags"].each do |tag|
            new_tag = Tag.find_or_create_by!(name: tag)
            observation.tags << new_tag if observation.tags.where(id: new_tag.id).empty?
          end
        end

        observation.save(validate: false)

        result["photos"].each do |photo|
          observation.photos.find_or_create_by!(url: photo["url"])
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
    user.update!(inaturalist_icon_url: data["results"].last["icon"]) if data["results"].last["icon"].present?
    puts "user #{user.inaturalist_login} updated"
  end
end

desc "update observation place"
task :update_observation_place => :environment do
  Place.all.each do |place|
    observations = Observation.where("longitude <= ?", place[:longitude] + Place::ACCURACY)
                     .where("longitude >= ?", place[:longitude] - Place::ACCURACY)
                     .where("latitude >= ?", place[:latitude] - Place::ACCURACY)
                     .where("latitude >= ?", place[:latitude] - Place::ACCURACY)
    observations.each do |observation|
      if observation.places.where(id: place.id).empty?
        observation.places << place
        p "observation #{observation.id} has #{observation.places.size} places: #{observation.places.pluck(:id)}"
      end
    end
    p "place #{place.chinese_name} is updated"
  end
end

desc "update observation period"
task :update_observation_period => :environment do
  Period.all.each do |period|
    Observation.all.each do |observation|
      if observation.observed_at.present?
        if period.start_year.nil? | period.end_year.nil?
          observation_month = observation.observed_at.month
          if period.start_month == period.end_month
            if observation_month == period.start_month
              observation.periods << period if observation.periods.where(id: period.id).empty?
              p "#{period.name}"
            end
          else
            if ([2, 3, 4].include? observation_month) && (period.name == "春季")
              observation.periods << period if observation.periods.where(id: period.id).empty?
              p "#{period.name}"
            end
            if ([5, 6, 7].include? observation_month) && (period.name == "夏季")
              observation.periods << period if observation.periods.where(id: period.id).empty?
              p "#{period.name}"
            end
            if ([8, 9, 10].include? observation_month) && (period.name == "秋季")
              observation.periods << period if observation.periods.where(id: period.id).empty?
              p "#{period.name}"
            end
            if ([11, 12, 1].include? observation_month) && (period.name == "冬季")
              observation.periods << period if observation.periods.where(id: period.id).empty?
              p "#{period.name}"
            end
          end
        else
          p "有精確日期"
        end
      end
    end
  end
end
