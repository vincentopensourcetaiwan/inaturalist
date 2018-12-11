describe InaturalistService do
  it "search" do
    body = "{\"total_results\":1,\"page\":1,\"per_page\":30,\"results\":[{\"out_of_range\":null,\"quality_grade\":\"needs_id\",\"time_observed_at\":\"2018-10-29T15:58:00-05:00\",\"annotations\":[],\"uuid\":\"9bf92af8-0fa8-4a5c-959b-1f314fecb113\",\"observed_on_details\":{\"date\":\"2018-10-29\",\"week\":44,\"month\":10,\"hour\":15,\"year\":2018,\"day\":29},\"id\":17929047,\"cached_votes_total\":0,\"identifications_most_agree\":true,\"created_at_details\":{\"date\":\"2018-10-29\",\"week\":44,\"month\":10,\"hour\":3,\"year\":2018,\"day\":29},\"species_guess\":\"Fungi Including Lichens\",\"identifications_most_disagree\":false,\"tags\":[],\"positional_accuracy\":122,\"comments_count\":0,\"site_id\":1,\"created_time_zone\":\"America/Chicago\",\"id_please\":false,\"license_code\":null,\"observed_time_zone\":\"America/Chicago\",\"quality_metrics\":[],\"public_positional_accuracy\":122,\"reviewed_by\":[614374,1051325],\"oauth_application_id\":null,\"flags\":[],\"created_at\":\"2018-10-29T03:00:03-05:00\",\"description\":\"可以吃, 菇\",\"time_zone_offset\":\"-06:00\",\"project_ids_with_curator_id\":[],\"observed_on\":\"2018-10-29\",\"observed_on_string\":\"2018/10/29 3:58 PM CST\",\"updated_at\":\"2018-12-09T23:02:35-06:00\",\"sounds\":[],\"place_ids\":[7887,7888,46475,65842,69587,97395,106968,128138,131031],\"captive\":false,\"taxon\":{\"ancestry\":\"48460/47170/47169/50814\",\"is_active\":true,\"min_species_ancestry\":\"48460,47170,47169,50814,47167\",\"endemic\":false,\"iconic_taxon_id\":47170,\"threatened\":false,\"rank_level\":40,\"introduced\":false,\"native\":false,\"parent_id\":50814,\"name\":\"Agaricales\",\"rank\":\"order\",\"extinct\":false,\"id\":47167,\"ancestor_ids\":[48460,47170,47169,50814,47167],\"taxon_schemes_count\":2,\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Agaricales\",\"current_synonymous_taxon_ids\":null,\"created_at\":\"2008-04-03T15:25:25+00:00\",\"taxon_changes_count\":2,\"complete_species_count\":null,\"observations_count\":280451,\"flag_counts\":{\"unresolved\":1,\"resolved\":0},\"atlas_id\":null,\"default_photo\":{\"square_url\":\"https://static.inaturalist.org/photos/22368779/square.jpg?1533066265\",\"attribution\":\"(c) tbigelow, some rights reserved (CC BY-NC)\",\"flags\":[],\"medium_url\":\"https://static.inaturalist.org/photos/22368779/medium.jpg?1533066265\",\"id\":22368779,\"license_code\":\"cc-by-nc\",\"original_dimensions\":{\"width\":1271,\"height\":2048},\"url\":\"https://static.inaturalist.org/photos/22368779/square.jpg?1533066265\"},\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"gilled mushrooms\"},\"outlinks\":[],\"faves_count\":0,\"ofvs\":[],\"num_identification_agreements\":1,\"preferences\":{\"prefers_community_taxon\":null},\"comments\":[],\"map_scale\":null,\"uri\":\"https://www.inaturalist.org/observations/17929047\",\"project_ids\":[],\"community_taxon_id\":47170,\"geojson\":{\"coordinates\":[\"121.404738\",\"24.378206\"],\"type\":\"Point\"},\"owners_identification_from_vision\":false,\"identifications_count\":1,\"obscured\":false,\"num_identification_disagreements\":0,\"geoprivacy\":null,\"location\":\"24.378206,121.404738\",\"votes\":[],\"spam\":false,\"user\":{\"id\":1051325,\"login\":\"vincent_lin\",\"spam\":false,\"suspended\":false,\"login_autocomplete\":\"vincent_lin\",\"login_exact\":\"vincent_lin\",\"name\":\"\",\"name_autocomplete\":\"\",\"icon\":\"https://static.inaturalist.org/attachments/users/icons/1051325/thumb.jpg?1540800125\",\"observations_count\":115,\"identifications_count\":0,\"journal_posts_count\":0,\"activity_count\":115,\"roles\":[],\"site_id\":1,\"icon_url\":\"https://static.inaturalist.org/attachments/users/icons/1051325/medium.jpg?1540800125\"},\"mappable\":true,\"identifications_some_agree\":true,\"project_ids_without_curator_id\":[],\"place_guess\":\"Taichung City, Taiwan\",\"identifications\":[{\"id\":38446414,\"uuid\":\"a34bcf27-f95d-4a5a-aa25-5265a45b5b63\",\"user\":{\"id\":1051325,\"login\":\"vincent_lin\",\"spam\":false,\"suspended\":false,\"login_autocomplete\":\"vincent_lin\",\"login_exact\":\"vincent_lin\",\"name\":\"\",\"name_autocomplete\":\"\",\"icon\":\"https://static.inaturalist.org/attachments/users/icons/1051325/thumb.jpg?1540800125\",\"observations_count\":115,\"identifications_count\":0,\"journal_posts_count\":0,\"activity_count\":115,\"roles\":[],\"site_id\":1,\"icon_url\":\"https://static.inaturalist.org/attachments/users/icons/1051325/medium.jpg?1540800125\"},\"created_at\":\"2018-10-29T16:00:44+08:00\",\"created_at_details\":{\"date\":\"2018-10-29\",\"day\":29,\"month\":10,\"year\":2018,\"hour\":16,\"week\":44},\"body\":\"\",\"category\":\"improving\",\"current\":true,\"flags\":[],\"own_observation\":true,\"taxon_change\":null,\"vision\":false,\"disagreement\":null,\"previous_observation_taxon_id\":null,\"spam\":false,\"taxon_id\":47170,\"taxon\":{\"taxon_schemes_count\":2,\"ancestry\":\"48460\",\"min_species_ancestry\":\"48460,47170\",\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Fungus\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"created_at\":\"2008-04-03T15:25:25+00:00\",\"taxon_changes_count\":3,\"complete_species_count\":null,\"rank\":\"kingdom\",\"extinct\":false,\"id\":47170,\"ancestor_ids\":[48460],\"observations_count\":808168,\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":3},\"rank_level\":70,\"atlas_id\":null,\"parent_id\":48460,\"complete_rank\":\"phylum\",\"name\":\"Fungi\",\"default_photo\":{\"square_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\",\"attribution\":\"(c) Harry Harms, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg\",\"id\":3439,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\"},\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Fungi Including Lichens\",\"ancestors\":[]}},{\"id\":38655089,\"uuid\":\"fc7ea241-29a9-4062-b7a1-f477ce2883e2\",\"user\":{\"id\":614374,\"login\":\"juhakinnunen\",\"spam\":false,\"suspended\":false,\"login_autocomplete\":\"juhakinnunen\",\"login_exact\":\"juhakinnunen\",\"name\":\"Juha Kinnunen\",\"name_autocomplete\":\"Juha Kinnunen\",\"icon\":\"https://static.inaturalist.org/attachments/users/icons/614374/thumb.gif?1542975190\",\"observations_count\":3639,\"identifications_count\":37024,\"journal_posts_count\":0,\"activity_count\":40663,\"roles\":[\"curator\"],\"site_id\":1,\"icon_url\":\"https://static.inaturalist.org/attachments/users/icons/614374/medium.gif?1542975190\"},\"created_at\":\"2018-11-02T02:03:36+08:00\",\"created_at_details\":{\"date\":\"2018-11-02\",\"day\":2,\"month\":11,\"year\":2018,\"hour\":2,\"week\":44},\"body\":\"\",\"category\":\"leading\",\"current\":true,\"flags\":[],\"own_observation\":false,\"taxon_change\":null,\"vision\":false,\"disagreement\":false,\"previous_observation_taxon_id\":47170,\"spam\":false,\"taxon_id\":47167,\"taxon\":{\"taxon_schemes_count\":2,\"ancestry\":\"48460/47170/47169/50814\",\"min_species_ancestry\":\"48460,47170,47169,50814,47167\",\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Agaricales\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"created_at\":\"2008-04-03T15:25:25+00:00\",\"taxon_changes_count\":2,\"complete_species_count\":null,\"rank\":\"order\",\"extinct\":false,\"id\":47167,\"ancestor_ids\":[48460,47170,47169,50814],\"observations_count\":280451,\"is_active\":true,\"flag_counts\":{\"unresolved\":1,\"resolved\":0},\"rank_level\":40,\"atlas_id\":null,\"parent_id\":50814,\"name\":\"Agaricales\",\"default_photo\":{\"square_url\":\"https://static.inaturalist.org/photos/22368779/square.jpg?1533066265\",\"attribution\":\"(c) tbigelow, some rights reserved (CC BY-NC)\",\"flags\":[],\"medium_url\":\"https://static.inaturalist.org/photos/22368779/medium.jpg?1533066265\",\"id\":22368779,\"license_code\":\"cc-by-nc\",\"original_dimensions\":{\"width\":1271,\"height\":2048},\"url\":\"https://static.inaturalist.org/photos/22368779/square.jpg?1533066265\"},\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"gilled mushrooms\",\"ancestors\":[{\"observations_count\":808168,\"taxon_schemes_count\":2,\"ancestry\":\"48460\",\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":3},\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Fungus\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"rank_level\":70,\"taxon_changes_count\":3,\"atlas_id\":null,\"complete_species_count\":null,\"parent_id\":48460,\"complete_rank\":\"phylum\",\"name\":\"Fungi\",\"rank\":\"kingdom\",\"extinct\":false,\"id\":47170,\"default_photo\":{\"square_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\",\"attribution\":\"(c) Harry Harms, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg\",\"id\":3439,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\"},\"ancestor_ids\":[48460,47170],\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Fungi Including Lichens\"},{\"observations_count\":537948,\"taxon_schemes_count\":2,\"ancestry\":\"48460/47170\",\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":2},\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Basidiomycota\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"rank_level\":60,\"taxon_changes_count\":3,\"atlas_id\":null,\"complete_species_count\":null,\"parent_id\":47170,\"name\":\"Basidiomycota\",\"rank\":\"phylum\",\"extinct\":false,\"id\":47169,\"default_photo\":{\"square_url\":\"https://farm2.staticflickr.com/1326/1245273170_d678c121ed_s.jpg\",\"attribution\":\"(c) John, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm2.staticflickr.com/1326/1245273170_d678c121ed.jpg\",\"id\":4396,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm2.staticflickr.com/1326/1245273170_d678c121ed_s.jpg\"},\"ancestor_ids\":[48460,47170,47169],\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Basidiomycete Fungi\"},{\"observations_count\":514079,\"taxon_schemes_count\":2,\"ancestry\":\"48460/47170/47169\",\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":0},\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Agaricomycetes\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"rank_level\":50,\"taxon_changes_count\":0,\"atlas_id\":null,\"complete_species_count\":null,\"parent_id\":47169,\"name\":\"Agaricomycetes\",\"rank\":\"class\",\"extinct\":false,\"id\":50814,\"default_photo\":{\"square_url\":\"https://farm3.staticflickr.com/2732/4181788361_30b8805d64_s.jpg\",\"attribution\":\"(c) Amadej Trnkoczy, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm3.staticflickr.com/2732/4181788361_30b8805d64.jpg\",\"id\":8400,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm3.staticflickr.com/2732/4181788361_30b8805d64_s.jpg\"},\"ancestor_ids\":[48460,47170,47169,50814],\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"agaricomycetes\"}]},\"previous_observation_taxon\":{\"taxon_schemes_count\":2,\"ancestry\":\"48460\",\"min_species_ancestry\":\"48460,47170\",\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Fungus\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"created_at\":\"2008-04-03T15:25:25+00:00\",\"taxon_changes_count\":3,\"complete_species_count\":null,\"rank\":\"kingdom\",\"extinct\":false,\"id\":47170,\"ancestor_ids\":[48460,47170],\"observations_count\":808168,\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":3},\"rank_level\":70,\"atlas_id\":null,\"parent_id\":48460,\"complete_rank\":\"phylum\",\"name\":\"Fungi\",\"default_photo\":{\"square_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\",\"attribution\":\"(c) Harry Harms, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg\",\"id\":3439,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\"},\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Fungi Including Lichens\"}}],\"project_observations\":[],\"photos\":[{\"id\":27392548,\"license_code\":null,\"url\":\"https://static.inaturalist.org/photos/27392548/square.jpeg?1540799900\",\"attribution\":\"(c) vincent_lin, all rights reserved\",\"original_dimensions\":{\"width\":2048,\"height\":1536},\"flags\":[]}],\"observation_photos\":[{\"id\":24597936,\"position\":0,\"uuid\":\"58a798b0-5fba-4712-994c-0d4e3d80343f\",\"photo\":{\"id\":27392548,\"license_code\":null,\"url\":\"https://static.inaturalist.org/photos/27392548/square.jpeg?1540799900\",\"attribution\":\"(c) vincent_lin, all rights reserved\",\"original_dimensions\":{\"width\":2048,\"height\":1536},\"flags\":[]}}],\"faves\":[],\"non_owner_ids\":[{\"id\":38655089,\"uuid\":\"fc7ea241-29a9-4062-b7a1-f477ce2883e2\",\"user\":{\"id\":614374,\"login\":\"juhakinnunen\",\"spam\":false,\"suspended\":false,\"login_autocomplete\":\"juhakinnunen\",\"login_exact\":\"juhakinnunen\",\"name\":\"Juha Kinnunen\",\"name_autocomplete\":\"Juha Kinnunen\",\"icon\":\"https://static.inaturalist.org/attachments/users/icons/614374/thumb.gif?1542975190\",\"observations_count\":3639,\"identifications_count\":37024,\"journal_posts_count\":0,\"activity_count\":40663,\"roles\":[\"curator\"],\"site_id\":1,\"icon_url\":\"https://static.inaturalist.org/attachments/users/icons/614374/medium.gif?1542975190\"},\"created_at\":\"2018-11-02T02:03:36+08:00\",\"created_at_details\":{\"date\":\"2018-11-02\",\"day\":2,\"month\":11,\"year\":2018,\"hour\":2,\"week\":44},\"body\":\"\",\"category\":\"leading\",\"current\":true,\"flags\":[],\"own_observation\":false,\"taxon_change\":null,\"vision\":false,\"disagreement\":false,\"previous_observation_taxon_id\":47170,\"spam\":false,\"taxon_id\":47167,\"taxon\":{\"taxon_schemes_count\":2,\"ancestry\":\"48460/47170/47169/50814\",\"min_species_ancestry\":\"48460,47170,47169,50814,47167\",\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Agaricales\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"created_at\":\"2008-04-03T15:25:25+00:00\",\"taxon_changes_count\":2,\"complete_species_count\":null,\"rank\":\"order\",\"extinct\":false,\"id\":47167,\"ancestor_ids\":[48460,47170,47169,50814],\"observations_count\":280451,\"is_active\":true,\"flag_counts\":{\"unresolved\":1,\"resolved\":0},\"rank_level\":40,\"atlas_id\":null,\"parent_id\":50814,\"name\":\"Agaricales\",\"default_photo\":{\"square_url\":\"https://static.inaturalist.org/photos/22368779/square.jpg?1533066265\",\"attribution\":\"(c) tbigelow, some rights reserved (CC BY-NC)\",\"flags\":[],\"medium_url\":\"https://static.inaturalist.org/photos/22368779/medium.jpg?1533066265\",\"id\":22368779,\"license_code\":\"cc-by-nc\",\"original_dimensions\":{\"width\":1271,\"height\":2048},\"url\":\"https://static.inaturalist.org/photos/22368779/square.jpg?1533066265\"},\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"gilled mushrooms\",\"ancestors\":[{\"observations_count\":808168,\"taxon_schemes_count\":2,\"ancestry\":\"48460\",\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":3},\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Fungus\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"rank_level\":70,\"taxon_changes_count\":3,\"atlas_id\":null,\"complete_species_count\":null,\"parent_id\":48460,\"complete_rank\":\"phylum\",\"name\":\"Fungi\",\"rank\":\"kingdom\",\"extinct\":false,\"id\":47170,\"default_photo\":{\"square_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\",\"attribution\":\"(c) Harry Harms, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg\",\"id\":3439,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\"},\"ancestor_ids\":[48460,47170],\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Fungi Including Lichens\"},{\"observations_count\":537948,\"taxon_schemes_count\":2,\"ancestry\":\"48460/47170\",\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":2},\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Basidiomycota\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"rank_level\":60,\"taxon_changes_count\":3,\"atlas_id\":null,\"complete_species_count\":null,\"parent_id\":47170,\"name\":\"Basidiomycota\",\"rank\":\"phylum\",\"extinct\":false,\"id\":47169,\"default_photo\":{\"square_url\":\"https://farm2.staticflickr.com/1326/1245273170_d678c121ed_s.jpg\",\"attribution\":\"(c) John, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm2.staticflickr.com/1326/1245273170_d678c121ed.jpg\",\"id\":4396,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm2.staticflickr.com/1326/1245273170_d678c121ed_s.jpg\"},\"ancestor_ids\":[48460,47170,47169],\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Basidiomycete Fungi\"},{\"observations_count\":514079,\"taxon_schemes_count\":2,\"ancestry\":\"48460/47170/47169\",\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":0},\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Agaricomycetes\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"rank_level\":50,\"taxon_changes_count\":0,\"atlas_id\":null,\"complete_species_count\":null,\"parent_id\":47169,\"name\":\"Agaricomycetes\",\"rank\":\"class\",\"extinct\":false,\"id\":50814,\"default_photo\":{\"square_url\":\"https://farm3.staticflickr.com/2732/4181788361_30b8805d64_s.jpg\",\"attribution\":\"(c) Amadej Trnkoczy, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm3.staticflickr.com/2732/4181788361_30b8805d64.jpg\",\"id\":8400,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm3.staticflickr.com/2732/4181788361_30b8805d64_s.jpg\"},\"ancestor_ids\":[48460,47170,47169,50814],\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"agaricomycetes\"}]},\"previous_observation_taxon\":{\"taxon_schemes_count\":2,\"ancestry\":\"48460\",\"min_species_ancestry\":\"48460,47170\",\"wikipedia_url\":\"http://en.wikipedia.org/wiki/Fungus\",\"current_synonymous_taxon_ids\":null,\"iconic_taxon_id\":47170,\"created_at\":\"2008-04-03T15:25:25+00:00\",\"taxon_changes_count\":3,\"complete_species_count\":null,\"rank\":\"kingdom\",\"extinct\":false,\"id\":47170,\"ancestor_ids\":[48460,47170],\"observations_count\":808168,\"is_active\":true,\"flag_counts\":{\"unresolved\":0,\"resolved\":3},\"rank_level\":70,\"atlas_id\":null,\"parent_id\":48460,\"complete_rank\":\"phylum\",\"name\":\"Fungi\",\"default_photo\":{\"square_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\",\"attribution\":\"(c) Harry Harms, some rights reserved (CC BY-NC-SA)\",\"flags\":[],\"medium_url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f.jpg\",\"id\":3439,\"license_code\":\"cc-by-nc-sa\",\"original_dimensions\":null,\"url\":\"https://farm4.staticflickr.com/3086/3159562169_1b9f2a083f_s.jpg\"},\"iconic_taxon_name\":\"Fungi\",\"preferred_common_name\":\"Fungi Including Lichens\"}}]}]}"

    stub_request(:get, "https://api.inaturalist.org/v1/observations?order=desc&order_by=created_at&per_page=1000&project_id=1ac02830-8817-404e-a6ab-86027362db9c&q=%E5%90%83").
      with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }).
      to_return(status: 200, body: body, headers: {})

    keyword = URI.encode("吃")
    observations = InaturalistService.search(keyword)
    expect(observations[0]["uri"]).to be_truthy
  end

end
