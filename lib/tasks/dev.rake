namespace :dev do
  desc "create no 3 users"
  task :create_no_3_users => :environment do
    password = "1qaz@WSX3edc"
    users = [
      { email: "nikartsai@mtschool.org", nickname: "晏霖", inaturalist_id: "2674872", inaturalist_login: "nikartsai" },
      { email: "tana36992002@mtschool.org", nickname: "歐歐", inaturalist_id: "3126757", inaturalist_login: "tana36992002" },
      { email: "wenyihuang@mtschool.org", nickname: "文儀", inaturalist_id: "1357631", inaturalist_login: "wenyihuang" },
      { email: "joycelin@mtschool.org", nickname: "Joyce", inaturalist_id: "3025145", inaturalist_login: "joycelin" },
      { email: "yuanwang12@mtschool.org", nickname: "汪緣", inaturalist_id: "3030713", inaturalist_login: "yuanwang12" },
      { email: "cecile33@mtschool.org", nickname: "藍", inaturalist_id: "2500774", inaturalist_login: "cecile33" },
      { email: "iams@mtschool.org", nickname: "小山", inaturalist_id: "3058719", inaturalist_login: "iams" },
      { email: "arleneg5@mtschool.org", nickname: "Arlene", inaturalist_id: "3063924", inaturalist_login: "arleneg5" },
      { email: "buffy7@mtschool.org", nickname: "小天", inaturalist_id: "3050442", inaturalist_login: "buffy7" },
      { email: "ruj@mtschool.org", nickname: "Ru", inaturalist_id: "3038841", inaturalist_login: "ruj" },
      { email: "julichen@mtschool.org", nickname: "Juli", inaturalist_id: "3040457", inaturalist_login: "julichen" },
      { email: "bamboo916@mtschool.org", nickname: "竹竹", inaturalist_id: "3080101", inaturalist_login: "bamboo916" },
      { email: "t_y@mtschool.org", nickname: "大魚", inaturalist_id: "3079785", inaturalist_login: "t_y" },
      { email: "shane0417@mtschool.org", nickname: "洪洪", inaturalist_id: "3038972", inaturalist_login: "shane0417" },
      { email: "chienan@mtschool.org", nickname: "安安", inaturalist_id: "3034391", inaturalist_login: "chienan" },
      { email: "martinni@mtschool.org", nickname: "馬丁", inaturalist_id: "3120624", inaturalist_login: "martinni" },
      { email: "naturalist333@mtschool.org", nickname: "凱翔", inaturalist_id: "92411", inaturalist_login: "naturalist333" },
      { email: "tinowang@mtschool.org", nickname: "Tino", inaturalist_id: "2515668", inaturalist_login: "tinowang" },
      { email: "bensonsoong@mtschool.org", nickname: "柏宣", inaturalist_id: "3020904", inaturalist_login: "bensonsoong" },
      { email: "camelhan@mtschool.org", nickname: "宗翰", inaturalist_id: "2093839", inaturalist_login: "camelhan" }
    ]

    users.each do |user|
      new_user = User.create(email: user[:email],
                             nickname: user[:nickname],
                             inaturalist_id: user[:inaturalist_id],
                             inaturalist_login: user[:inaturalist_login],
                             password: password,
                             password_confirmation: password)
      new_user.confirm
      new_user.add_role(:contributor)
      p "#{new_user.nickname} is created and confirm is #{new_user.confirmed?} and  has roles: #{new_user.roles.map(&:name)}"
    end
  end

  desc "get project members"
  task :get_project_members => :environment do
    require 'csv'
    @members = []
    url = "https://api.inaturalist.org/v1/projects/1ac02830-8817-404e-a6ab-86027362db9c/members"
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
      url = "https://api.inaturalist.org/v1/projects/1ac02830-8817-404e-a6ab-86027362db9c/members?page=#{index + 1}"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      data = JSON.parse(response.body)

      data["results"].map { |member|
        @members << {
          user_id: member["user_id"],
          login: member["user"]["login"],
          name: member["user"]["name"]
        }
      }
    end
    CSV.open("tmp/#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")}-members.csv", "wb") do |csv|
      @members.each do |member|
        element = [member[:user_id], member[:login], member[:name]]
        csv << element
      end
    end
  end

  desc "disable vincent's dali observations"
  task :disable_vincent_dali_observations => :environment do
    user = User.find_by(email: "vincent@mtschool.org")
    user.observations.update_all(disabled: true)
  end

  desc "create judy"
  task :create_judy => :environment do
    password = "1qaz@WSX3edc"
    new_user = User.create(email: "judy@mtschool.org",
                           nickname: "吉野櫻",
                           inaturalist_id: "1562460",
                           inaturalist_login: "judyliu",
                           password: password,
                           password_confirmation: password)
    new_user.confirm
    new_user.add_role(:contributor)
    p "#{new_user.nickname} is created and confirm is #{new_user.confirmed?} and  has roles: #{new_user.roles.map(&:name)}"
  end

  desc "create new users"
  task :create_new_users => :environment do
    password = "1qaz@WSX3edc"
    users = [
      { email: "vera@mtschool.org", nickname: "思叡", inaturalist_id: "1043450", inaturalist_login: "sirui" },
      { email: "sflee@mtschool.org", nickname: "十分", inaturalist_id: "1559254", inaturalist_login: "sflee" },
      { email: "yehcat@mtschool.org", nickname: "大貓", inaturalist_id: "1540735", inaturalist_login: "yehcat" }
    ]

    users.each do |user|
      new_user = User.create(email: user[:email],
                             nickname: user[:nickname],
                             inaturalist_id: user[:inaturalist_id],
                             inaturalist_login: user[:inaturalist_login],
                             password: password,
                             password_confirmation: password)
      new_user.confirm
      new_user.add_role(:contributor)
      p "#{new_user.nickname} is created and confirm is #{new_user.confirmed?} and  has roles: #{new_user.roles.map(&:name)}"
    end
  end

  desc 'period seed'
  task period_seed: :environment do
    periods = [
      { name: "一月", start_year: nil, start_month: 1, start_day: 1, end_year: nil, end_month: 1, end_day: 31 },
      { name: "二月", start_year: nil, start_month: 2, start_day: 1, end_year: nil, end_month: 2, end_day: 31 },
      { name: "三月", start_year: nil, start_month: 3, start_day: 1, end_year: nil, end_month: 3, end_day: 31 },
      { name: "四月", start_year: nil, start_month: 4, start_day: 1, end_year: nil, end_month: 4, end_day: 31 },
      { name: "五月", start_year: nil, start_month: 5, start_day: 1, end_year: nil, end_month: 5, end_day: 31 },
      { name: "六月", start_year: nil, start_month: 6, start_day: 1, end_year: nil, end_month: 6, end_day: 31 },
      { name: "七月", start_year: nil, start_month: 7, start_day: 1, end_year: nil, end_month: 7, end_day: 31 },
      { name: "八月", start_year: nil, start_month: 8, start_day: 1, end_year: nil, end_month: 8, end_day: 31 },
      { name: "九月", start_year: nil, start_month: 9, start_day: 1, end_year: nil, end_month: 9, end_day: 31 },
      { name: "十月", start_year: nil, start_month: 10, start_day: 1, end_year: nil, end_month: 10, end_day: 31 },
      { name: "十一月", start_year: nil, start_month: 11, start_day: 1, end_year: nil, end_month: 11, end_day: 31 },
      { name: "十二月", start_year: nil, start_month: 12, start_day: 1, end_year: nil, end_month: 12, end_day: 31 },
      { name: "春季", start_year: nil, start_month: 2, start_day: 1, end_year: nil, end_month: 4, end_day: 31 },
      { name: "夏季", start_year: nil, start_month: 5, start_day: 1, end_year: nil, end_month: 7, end_day: 31 },
      { name: "秋季", start_year: nil, start_month: 8, start_day: 1, end_year: nil, end_month: 10, end_day: 31 },
      { name: "冬季", start_year: nil, start_month: 11, start_day: 1, end_year: nil, end_month: 1, end_day: 31 }
    ]

    periods.each do |period|
      new_period = Period.create(name: period[:name],
                                 start_year: period[:start_year],
                                 start_month: period[:start_month],
                                 start_day: period[:start_day],
                                 end_year: period[:end_year],
                                 end_month: period[:end_month],
                                 end_day: period[:end_day])
      p "new_period #{new_period.start_year} #{new_period.start_month} #{new_period.start_day} - #{new_period.end_year} #{new_period.end_month} #{new_period.end_day}"
    end
  end

  desc 'place seed'
  task place_seed: :environment do
    places = [
      { name: "Yunleng Cabin", chinese_name: "雲稜山莊", longitude: 121.3970180, latitude: 24.3783240 },
      { name: "Song Feng Ling", chinese_name: "松風嶺", longitude: 121.3704440, latitude: 24.3714090 },
      { name: "Nanhu Mountain", chinese_name: "南湖大山", longitude: 121.4393720, latitude: 24.3618300 },
      { name: "Shen Ma Jhen Mountain", chinese_name: "審馬陣山", longitude: 121.4174670, latitude: 24.3802390 },
      { name: "Duo Jia Tun Mountain Leading Peak", chinese_name: "多加屯山前峰", longitude: 121.3751150, latitude: 24.3693250 },
      { name: "Duo Jia Tun Mountain", chinese_name: "多加屯山", longitude: 121.3811590, latitude: 24.3677600 },
      { name: "Wood Pole Saddle", chinese_name: "木杆鞍部", longitude: 121.3929750, latitude: 24.3761700 },
      { name: "Nanhu Cabin", chinese_name: "南湖山屋", longitude: 121.4435390, latitude: 24.3695620 },
      { name: "Wu Yan Peak", chinese_name: "五岩峰", longitude: 121.4399380, latitude: 24.3780540 },
      { name: "Nanhu North Mountain", chinese_name: "南湖北山", longitude: 121.4371820, latitude: 24.3836660 }
    ]

    places.each do |place|
      created_place = Place.create!(name: place[:name], chinese_name: place[:chinese_name], longitude: place[:longitude], latitude: place[:latitude])
      p "place #{created_place.id} #{created_place.name} #{created_place.chinese_name} #{created_place.longitude} #{created_place.latitude}"
    end

  end

  desc 'update places'
  task update_place: :environment do
    places = [
      { name: "Yunleng Cabin", chinese_name: "雲稜山莊", longitude: 121.3970180, latitude: 24.3783240 },
      { name: "Song Feng Ling", chinese_name: "松風嶺", longitude: 121.3704440, latitude: 24.3714090 },
      { name: "Nanhu Mountain", chinese_name: "南湖大山", longitude: 121.4393720, latitude: 24.3618300 },
      { name: "Shen Ma Jhen Mountain", chinese_name: "審馬陣山", longitude: 121.4174670, latitude: 24.3802390 },
      { name: "Duo Jia Tun Mountain Leading Peak", chinese_name: "多加屯山前峰", longitude: 121.3751150, latitude: 24.3693250 },
      { name: "Duo Jia Tun Mountain", chinese_name: "多加屯山", longitude: 121.3811590, latitude: 24.3677600 },
      { name: "Wood Pole Saddle", chinese_name: "木杆鞍部", longitude: 121.3929750, latitude: 24.3761700 },
      { name: "Nanhu Cabin", chinese_name: "南湖山屋", longitude: 121.4435390, latitude: 24.3695620 },
      { name: "Wu Yan Peak", chinese_name: "五岩峰", longitude: 121.4399380, latitude: 24.3780540 },
      { name: "Nanhu North Mountain", chinese_name: "南湖北山", longitude: 121.4371820, latitude: 24.3836660 }
    ]
    places.each do |place|
      observations = Observation.where("longitude <= ?", place[:longitude] + 0.001)
                       .where("longitude >= ?", place[:longitude] - 0.001)
                       .where("latitude >= ?", place[:latitude] - 0.001)
                       .where("latitude >= ?", place[:latitude] - 0.001).pluck(:id)

      p "#{place[:name]} #{place[:chinese_name]} #{observations.count} #{observations}"
    end
  end

  desc 'update observation name'
  task update_observation_name: :environment do
    Observation.where(name: nil).where.not(description: nil).each do |observation|
      p "id: #{observation.id}"
      p "inaturalist_id: #{observation.inaturalist_id}"
      p "description: #{observation.description}"
      p "name: #{observation.name}"

      new_name = observation.description.gsub(/[a-zA-Z]/, "").gsub(/\,/, "").gsub("\n", "").gsub(/\s+/, '')
      p "new_name: #{new_name}"

      observation.update(name: new_name)
      p "observation #{observation.id} update name: #{observation.name}"
      p "--------------------------------------------"
    end
  end

  desc 'assign category'
  task assign_category: :environment do
    Observation.all.each do |observation|
      category = Category.find_by(name: observation.category_name)
      if category.present?
        observation.update(category: category)
        p "observation #{observation.id} is assign to #{category.chinese_name}"
      end
    end
  end

  desc 'create categories'
  task create_categories: :environment do
    categories = [
      { name: "Aves", chinese_name: "鳥類" },
      { name: "Amphibia", chinese_name: "兩棲類" },
      { name: "Reptilia", chinese_name: "爬行動物" },
      { name: "Mammalia", chinese_name: "哺乳類" },
      { name: "Actinopterygii", chinese_name: "魚類" },
      { name: "Mollusca", chinese_name: "軟體動物" },
      { name: "Arachnida", chinese_name: "蜘蛛" },
      { name: "Insecta", chinese_name: "昆蟲" },
      { name: "Plantae", chinese_name: "植物" },
      { name: "Fungi", chinese_name: "菌類" },
      { name: "Protozoa", chinese_name: "原生動物" },
      { name: "unknown", chinese_name: "未知" }
    ]

    categories.each do |category|
      c = Category.create(name: category[:name], chinese_name: category[:chinese_name])
      p "category #{c.name} #{c.chinese_name} is created"
    end

  end

  desc 'assign contributor role'
  task assign_contributor_role: :environment do
    User.where.not(inaturalist_id: nil).each do |user|
      user.add_role :contributor
    end
  end

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
    binding.pry
  end
end