namespace :dev do
  desc 'test_auth'
  task test_auth: :environment do
    require 'rubygems'
    require 'rest_client'
    require 'json'

    site = "https://www.inaturalist.org"
    app_id = Rails.application.secrets.inaturalist[:app_id]
    app_secret = Rails.application.secrets.inaturalist[:app_secret]
    redirect_uri = 'http://localhost:3000/' # you can set this to some URL you control for testing

    # REQUEST AN AUTHORIZATION CODE
    # Your web app should redirect the user to this url. They should see a screen
    # offering them the choice to authorize your app. If they aggree, they will be
    # redirected to your redirect_uri with a "code" parameter
    # url = "#{site}/oauth/authorize?client_id=#{app_id}&redirect_uri=#{redirect_uri}&response_type=code"

    # REQUEST AN AUTH TOKEN
    # Once your app has that code parameter, you can exchange it for an access token:
    # puts "Go to #{url}, approve the app, and you should be redirected to your " +
    #        "redirect_uri. Copy and paste the 'code' param here."
    # print "Code: "
    # auth_code = gets.strip
    # puts


    permitted = params.permit(:code)
    attributes = permitted.to_h || {}
    attributes.values

    # binding.pry
    payload = {
      :client_id => app_id,
      :client_secret => app_secret,
      :code => attributes[:code],
      :redirect_uri => redirect_uri,
      :grant_type => "authorization_code"
    }
    puts "POST #{site}/oauth/token, payload: #{payload.inspect}"
    # binding.pry
    puts response = RestClient.post("#{site}/oauth/token", payload)
    # puts
    # response will be a chunk of JSON looking like
    # {
    #   "access_token":"xxx",
    #   "token_type":"bearer",
    #   "expires_in":null,
    #   "refresh_token":null,
    #   "scope":"write"
    # }

    # Store the token (access_token) in your web app. You can now use it to make authorized
    # requests on behalf of the user, like retrieving profile data:
    token = JSON.parse(response)["access_token"]
    # headers = { "Authorization" => "Bearer #{token}" }
    # puts "GET /users/edit.json, headers: #{headers.inspect}"
    # puts RestClient.get("#{site}/users/edit.json", headers)
    # puts

    puts token
    binding.pry
  end


  desc 'observation'
  task observation: :environment do
    require "net/https"
    require "uri"
    require 'json'

    uri = URI.parse("https://api.inaturalist.org/v1/observations?project_id=1ac02830-8817-404e-a6ab-86027362db9c&user_id=yangsheng&page=1&per_page=1&order=desc&order_by=created_at")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    data = JSON.parse(response.body)

  end

  desc 'get observation'
  task get_observation: :environment do
    require 'net/http'
    require 'uri'
    require 'rubygems'
    require 'json'
    request = Net::HTTP.get URI('https://api.inaturalist.org/v1/observations/15778050')
    data = JSON.parse(request)

  end

  desc 'test'
  task test: :environment do
    {
      "out_of_range" => false,
      "quality_grade" => "needs_id",
      "time_observed_at" => "2018-07-21T12:10:00-05:00",
      "annotations" => [],
      "uuid" => "6879340b-5a49-4e25-9898-dbff56c81b15",
      "photos" => [
        [0] {
        "attribution" => "(c) Chiang Yang-Sheng, all rights reserved",
        "flags" => [],
        "id" => 23179530,
        "license_code" => nil,
        "original_dimensions" => {
          "width" => 2048,
          "height" => 1536
        },
        "url" => "https://static.inaturalist.org/photos/23179530/square.jpg?1534350783"
      }
    ],
      "observed_on_details" => {
      "date" => "2018-07-21",
      "week" => 29,
      "month" => 7,
      "hour" => 12,
      "year" => 2018,
      "day" => 21
    },
      "id" => 15451409,
      "cached_votes_total" => 0,
      "identifications_most_agree" => false,
    "created_at_details" => {
      "date" => "2018-08-15",
      "week" => 33,
      "month" => 8,
      "hour" => 11,
      "year" => 2018,
      "day" => 15
    },
      "species_guess" => nil,
    "identifications_most_disagree" => false,
    "tags" => [],
      "positional_accuracy" => nil,
    "comments_count" => 0,
      "site_id" => 1,
      "created_time_zone" => "America/Chicago",
      "id_please" => false,
    "license_code" => nil,
    "observed_time_zone" => "America/Chicago",
      "quality_metrics" => [],
      "public_positional_accuracy" => nil,
    "reviewed_by" => [
      [0] 946962
    ],
      "oauth_application_id" => nil,
    "flags" => [],
      "created_at" => "2018-08-15T11:33:10-05:00",
      "description" => nil,
    "time_zone_offset" => "-06:00",
      "project_ids_with_curator_id" => [],
      "observed_on" => "2018-07-21",
      "observed_on_string" => "2018/07/21 12:10 PM CST",
      "updated_at" => "2018-08-15T21:48:52-05:00",
      "sounds" => [],
      "place_ids" => [
      [0] 7887,
      [1] 7888,
      [2] 46475,
      [3] 65842,
      [4] 69587,
      [5] 97395,
      [6] 106968,
      [7] 128138
    ],
      "captive" => false,
    "taxon" => {
      "is_active" => true,
      "ancestry" => "48460",
      "min_species_ancestry" => "48460,47170",
      "endemic" => false,
      "iconic_taxon_id" => 47170,
      "threatened" => false,
      "rank_level" => 70,
      "introduced" => false,
      "native" => false,
      "parent_id" => 48460,
      "name" => "Fungi",
      "rank" => "kingdom",
      "extinct" => false,
      "id" => 47170,
      "ancestor_ids" => [
        [0] 48460,
      [1] 47170
    ],
      "taxon_schemes_count" => 2,
      "wikipedia_url" => "http://en.wikipedia.org/wiki/Fungus",
      "current_synonymous_taxon_ids" => nil,
    "created_at" => "2008-04-03T15:25:25+00:00",
      "taxon_changes_count" => 3,
      "complete_species_count" => nil,
    "observations_count" => 715251,
      "flag_counts" => {
      "unresolved" => 0,
      "resolved" => 3
    },
      "atlas_id" => nil,
    "default_photo" => {
      "square_url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg",
      "attribution" => "(c) Harry Harms, some rights reserved (CC BY-NC-SA)",
      "flags" => [],
      "medium_url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg",
      "id" => 3439,
      "license_code" => "cc-by-nc-sa",
      "original_dimensions" => nil,
      "url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg"
    },
      "iconic_taxon_name" => "Fungi",
      "preferred_common_name" => "Fungi Including Lichens"
    },
      "outlinks" => [],
      "faves_count" => 0,
      "ofvs" => [],
      "num_identification_agreements" => 0,
      "preferences" => {
      "prefers_community_taxon" => nil
    },
      "comments" => [],
      "map_scale" => nil,
    "uri" => "https://www.inaturalist.org/observations/15451409",
      "project_ids" => [],
      "identifications" => [
      [0] {
      "disagreement" => nil,
      "flags" => [],
      "created_at" => "2018-08-16T02:48:52+00:00",
      "taxon_id" => 47170,
      "body" => "",
      "own_observation" => false,
      "uuid" => "9a410158-05d5-4e22-8b39-70546cfbc45c",
      "taxon_change" => nil,
      "vision" => false,
      "current" => true,
      "id" => 33410427,
      "created_at_details" => {
        "date" => "2018-08-16",
        "week" => 33,
        "month" => 8,
        "hour" => 2,
        "year" => 2018,
        "day" => 16
      },
      "category" => "leading",
      "spam" => false,
      "user" => {
        "id" => 946962,
        "login" => "chengte",
        "spam" => false,
        "suspended" => false,
        "login_autocomplete" => "chengte",
        "login_exact" => "chengte",
        "name" => "Cheng Te Hsu",
        "name_autocomplete" => "Cheng Te Hsu",
        "icon" => "https://static.inaturalist.org/attachments/users/icons/946962/thumb.jpg?1534683638",
        "observations_count" => 728,
        "identifications_count" => 3087,
        "journal_posts_count" => 0,
        "activity_count" => 3815,
        "roles" => [
          [0] "curator"
      ],
      "site_id" => 1,
      "icon_url" => "https://static.inaturalist.org/attachments/users/icons/946962/medium.jpg?1534683638"
    },
      "previous_observation_taxon_id" => nil,
    "taxon" => {
      "taxon_schemes_count" => 2,
      "ancestry" => "48460",
      "min_species_ancestry" => "48460,47170",
      "wikipedia_url" => "http://en.wikipedia.org/wiki/Fungus",
      "current_synonymous_taxon_ids" => nil,
      "iconic_taxon_id" => 47170,
      "created_at" => "2008-04-03T15:25:25+00:00",
      "taxon_changes_count" => 3,
      "complete_species_count" => nil,
      "rank" => "kingdom",
      "extinct" => false,
      "id" => 47170,
      "ancestor_ids" => [
        [0] 48460
    ],
      "observations_count" => 715251,
      "is_active" => true,
    "flag_counts" => {
      "unresolved" => 0,
      "resolved" => 3
    },
      "rank_level" => 70,
      "atlas_id" => nil,
    "parent_id" => 48460,
      "name" => "Fungi",
      "default_photo" => {
      "square_url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg",
      "attribution" => "(c) Harry Harms, some rights reserved (CC BY-NC-SA)",
      "flags" => [],
      "medium_url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg",
      "id" => 3439,
      "license_code" => "cc-by-nc-sa",
      "original_dimensions" => nil,
      "url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg"
    },
      "iconic_taxon_name" => "Fungi",
      "preferred_common_name" => "Fungi Including Lichens",
      "ancestors" => []
    }
    }
    ],
      "community_taxon_id" => nil,
    "geojson" => {
      "coordinates" => [
        [0] "121.4252777778",
      [1] "24.3825"
    ],
      "type" => "Point"
    },
      "owners_identification_from_vision" => nil,
    "identifications_count" => 0,
      "obscured" => false,
    "project_observations" => [],
      "num_identification_disagreements" => 0,
      "observation_photos" => [
      [0] {
      "id" => 21087351,
      "position" => 0,
      "uuid" => "53d0f9e0-db7b-4329-b890-63821e047798",
      "photo" => {
        "attribution" => "(c) Chiang Yang-Sheng, all rights reserved",
        "flags" => [],
        "id" => 23179530,
        "license_code" => nil,
        "original_dimensions" => {
          "width" => 2048,
          "height" => 1536
        },
        "url" => "https://static.inaturalist.org/photos/23179530/square.jpg?1534350783"
      }
    }
    ],
      "geoprivacy" => nil,
    "location" => "24.3825,121.4252777778",
      "votes" => [],
      "spam" => false,
    "user" => {
      "id" => 1105943,
      "login" => "yangsheng",
      "spam" => false,
      "suspended" => false,
      "login_autocomplete" => "yangsheng",
      "login_exact" => "yangsheng",
      "name" => "Chiang Yang-Sheng",
      "name_autocomplete" => "Chiang Yang-Sheng",
      "icon" => "https://static.inaturalist.org/attachments/users/icons/1105943/thumb.jpg?1534270029",
      "observations_count" => 183,
      "identifications_count" => 0,
      "journal_posts_count" => 0,
      "activity_count" => 183,
      "roles" => [],
      "site_id" => 1,
      "icon_url" => "https://static.inaturalist.org/attachments/users/icons/1105943/medium.jpg?1534270029"
    },
      "mappable" => true,
    "identifications_some_agree" => false,
    "project_ids_without_curator_id" => [],
      "place_guess" => "台灣宜蘭縣",
      "faves" => [],
      "non_owner_ids" => [
      [0] {
      "disagreement" => nil,
      "flags" => [],
      "created_at" => "2018-08-16T02:48:52+00:00",
      "taxon_id" => 47170,
      "body" => "",
      "own_observation" => false,
      "uuid" => "9a410158-05d5-4e22-8b39-70546cfbc45c",
      "taxon_change" => nil,
      "vision" => false,
      "current" => true,
      "id" => 33410427,
      "created_at_details" => {
        "date" => "2018-08-16",
        "week" => 33,
        "month" => 8,
        "hour" => 2,
        "year" => 2018,
        "day" => 16
      },
      "category" => "leading",
      "spam" => false,
      "user" => {
        "id" => 946962,
        "login" => "chengte",
        "spam" => false,
        "suspended" => false,
        "login_autocomplete" => "chengte",
        "login_exact" => "chengte",
        "name" => "Cheng Te Hsu",
        "name_autocomplete" => "Cheng Te Hsu",
        "icon" => "https://static.inaturalist.org/attachments/users/icons/946962/thumb.jpg?1534683638",
        "observations_count" => 728,
        "identifications_count" => 3087,
        "journal_posts_count" => 0,
        "activity_count" => 3815,
        "roles" => [
          [0] "curator"
      ],
      "site_id" => 1,
      "icon_url" => "https://static.inaturalist.org/attachments/users/icons/946962/medium.jpg?1534683638"
    },
      "previous_observation_taxon_id" => nil,
    "taxon" => {
      "taxon_schemes_count" => 2,
      "ancestry" => "48460",
      "min_species_ancestry" => "48460,47170",
      "wikipedia_url" => "http://en.wikipedia.org/wiki/Fungus",
      "current_synonymous_taxon_ids" => nil,
      "iconic_taxon_id" => 47170,
      "created_at" => "2008-04-03T15:25:25+00:00",
      "taxon_changes_count" => 3,
      "complete_species_count" => nil,
      "rank" => "kingdom",
      "extinct" => false,
      "id" => 47170,
      "ancestor_ids" => [
        [0] 48460
    ],
      "observations_count" => 715251,
      "is_active" => true,
    "flag_counts" => {
      "unresolved" => 0,
      "resolved" => 3
    },
      "rank_level" => 70,
      "atlas_id" => nil,
    "parent_id" => 48460,
      "name" => "Fungi",
      "default_photo" => {
      "square_url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg",
      "attribution" => "(c) Harry Harms, some rights reserved (CC BY-NC-SA)",
      "flags" => [],
      "medium_url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg",
      "id" => 3439,
      "license_code" => "cc-by-nc-sa",
      "original_dimensions" => nil,
      "url" => "https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg"
    },
      "iconic_taxon_name" => "Fungi",
      "preferred_common_name" => "Fungi Including Lichens",
      "ancestors" => []
    }
    }
    ]
    }

  end

end